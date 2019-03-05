//
//  SCCoreDataManager.m
//  libscutils
//
//  Created by 沈宸 on 2019/2/15.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import "SCCoreDataManager.h"
#define SCStrIsEmpty(str)                                             \
    ((str == nil) || ([str isEqualToString:@""]) || (str == NULL) || \
     ([str isKindOfClass:[NSNull class]]))

#define kPathDocument                                                           \
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, \
                                         YES) firstObject]

@interface SCCoreDataManager ()
/**
 数据模型
 */
@property (nonatomic, strong) NSManagedObjectModel *objectModel;

/**
 持久化数据
 */
@property (nonatomic, strong) NSPersistentStoreCoordinator *coordinator;

/**
 管理数据上下文对象
 */
@property (nonatomic, strong) NSManagedObjectContext *objectContext;
@end

@implementation SCCoreDataManager
+ (instancetype)shareInstance
{
    static SCCoreDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      manager = [SCCoreDataManager new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        // 创建托管对象模型
        NSString *path =
            [[NSBundle mainBundle] pathForResource:@"SCCoreData"
                                            ofType:@"momd"];
        NSURL *url = [NSURL URLWithString:path];
        _objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
        // 创建持久化数据协调器
        _coordinator = [[NSPersistentStoreCoordinator alloc]
            initWithManagedObjectModel:_objectModel];
        // 关联并创建本地数据库文件 (会在沙盒CoreData创建数据库文件)
        [_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                   configuration:nil
                                             URL:[self dataBasePath]
                                         options:nil
                                           error:nil];
        // 创建托管对象上下文
        _objectContext = [[NSManagedObjectContext alloc]
            initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_objectContext setPersistentStoreCoordinator:_coordinator];
    }
    return self;
}

+ (void)destory
{
    NSString *filePath =
        [kPathDocument stringByAppendingPathComponent:@"CoreData"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}

#pragma mark - 数据的增删改查
+ (__kindof NSManagedObject *)getModelWithEntityName:
    (NSString *_Nonnull)entityName
{
    NSManagedObject *object = [NSEntityDescription
        insertNewObjectForEntityForName:entityName
                 inManagedObjectContext:[SCCoreDataManager shareInstance]
                                            .objectContext];
    return object;
}

+ (BOOL)save
{
    NSError *error;
    BOOL success = [[SCCoreDataManager shareInstance].objectContext save:&error];
    return success;
}

+ (BOOL)deleteByEntityName:(NSString *_Nonnull)entityName
               WithMaching:(NSString *_Nonnull)searchString
             WithAttribute:(NSString *_Nonnull)attribute
{
    // 没有输入删除条件
    if (SCStrIsEmpty(attribute) || SCStrIsEmpty(searchString))
    {
        return YES;
    }
    // 查询数据
    NSArray *array = [self selectByEntityName:entityName
                                  withMaching:searchString
                                WithAttribute:attribute
                                    sortingBy:attribute
                                  isAscending:YES];
    if (array.count)
    {
        for (NSManagedObject *object in array)
        {
            [[SCCoreDataManager shareInstance].objectContext deleteObject:object];
        }
    }
    // 执行保存操作
    return [SCCoreDataManager save];
}

+ (BOOL)updateManagedObject:(__kindof NSManagedObject *)managedObject
{
    [[SCCoreDataManager shareInstance].objectContext refreshObject:managedObject
                                                      mergeChanges:YES];
    return [SCCoreDataManager save];
}

+ (NSArray *)selectByEntityName:(NSString *_Nonnull)entityName
                    withMaching:(NSString *_Nullable)searchString
                  WithAttribute:(NSString *_Nullable)attribute
                      sortingBy:(NSString *_Nullable)sortAttribute
                    isAscending:(BOOL)ascending
{
    NSEntityDescription *entity = [NSEntityDescription
                 entityForName:entityName
        inManagedObjectContext:[SCCoreDataManager shareInstance].objectContext];
    // 创建fetch请求
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    // 一次性获取完
    fetchRequest.fetchBatchSize = 0;
    if (!SCStrIsEmpty(sortAttribute))
    {
        // 排序
        NSSortDescriptor *sortDescriptor =
            [[NSSortDescriptor alloc] initWithKey:sortAttribute
                                        ascending:ascending
                                         selector:nil];
        NSArray *descriptors = @[ sortDescriptor ];
        fetchRequest.sortDescriptors = descriptors;
    }
    else
    {
        fetchRequest.sortDescriptors = @[];
    }

    if (!SCStrIsEmpty(searchString) && !SCStrIsEmpty(attribute))
    {
        //某个属性的值包含某个字符串
        //%K 某个属性的值
        //%@ 传递过来的字符串
        //模糊查询 contains[cd] 包含某个值 c标识忽略大小写，d标识忽略重音
        //查询 ==
        fetchRequest.predicate =
            [NSPredicate predicateWithFormat:@"%K == %@", attribute, searchString];
    }

    NSError *error = nil;
    NSFetchedResultsController *fetchdController =
        [[NSFetchedResultsController alloc]
            initWithFetchRequest:fetchRequest
            managedObjectContext:[SCCoreDataManager shareInstance].objectContext
              sectionNameKeyPath:nil
                       cacheName:nil];
    // 执行获取操作
    if ([fetchdController performFetch:&error])
    {
        //获取数据
        return [fetchdController fetchedObjects];
    }
    else
    {
        return @[];
    }
}
#pragma mark - private
/**
 获取数据库路径

 @return 数据库的URL
 */
- (NSURL *)dataBasePath
{
    NSString *dbFolder =
        [kPathDocument stringByAppendingPathComponent:@"CoreData"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbFolder])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:dbFolder
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    NSURL *dbUrl = [[NSURL fileURLWithPath:dbFolder]
        URLByAppendingPathComponent:@"db.sqlite"];
    return dbUrl;
}
@end
