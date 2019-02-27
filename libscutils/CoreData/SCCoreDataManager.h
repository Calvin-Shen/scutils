//
//  SCCoreDataManager.h
//  libscutils
//
//  Created by 沈宸 on 2019/2/15.
//  Copyright © 2019 沈宸. All rights reserved.
//

/*
 CoreData管理类，应用此类工程中的.xcdatamodeld文件名必须为SCCoreData.xcdatamodeld
 
 如果改变.xcdatamodeld文件的结构，必须删除沙盒的CoreData文件夹，不然会报'NSPersistentStoreCoordinator has no persistent stores'的错误。
 */

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCCoreDataManager : NSObject
/**
 创建CoreData管理单例对象

 @return 单例对象
 */
+ (instancetype)shareInstance;


/**
 销毁数据库
 */
+ (void)destory;

/**
 创建新的数据

 @param entityName 数据模型类名称
 @return 数据模型
 */
+ (__kindof NSManagedObject *)getModelWithEntityName:(NSString *_Nonnull)entityName;

/**
 保存数据

 @return 是否保存成功
 */
+ (BOOL)save;

/**
 删除数据

 @param entityName 数据模型类名称
 @param searchString 属性名的值包含的字符
 @param attribute 属性名称
 @return 成功或者失败
 */
+ (BOOL)deleteByEntityName:(NSString * _Nonnull)entityName
               WithMaching:(NSString * _Nonnull)searchString
             WithAttribute:(NSString * _Nonnull)attribute;

/**
 更新数据

 @param managedObject 模型对象
 @return 成功或者失败
 */
+ (BOOL)updateManagedObject:(__kindof NSManagedObject *)managedObject;

/**
 查询数据

 @param entityName 数据模型类名称
 @param searchString 属性名的值包含的字符
 @param attribute 属性名称
 @param sortAttribute 按哪个属性名称排序
 @param ascending 是否升序
 @return 模型数组
 */
+ (NSArray *)selectByEntityName:(NSString * _Nonnull)entityName
                   withMaching:(NSString * _Nullable)searchString
                 WithAttribute:(NSString * _Nullable)attribute
                     sortingBy:(NSString * _Nullable)sortAttribute
                   isAscending:(BOOL)ascending;
@end

NS_ASSUME_NONNULL_END
