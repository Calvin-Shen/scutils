//
//  SCUtility+File.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility (File)
/**
 计算指定路径的文件大小
 
 @param path 文件路径
 @return 指定文件的字节数大小
 */
- (NSUInteger)sc_fileSizeAtPath:(NSString *)path;

/**
 根据字节数返回一个反应文件大小的字符串 i.e. 比如1024个字节就返回@"1K" 1024*1024f个字节返回@"1.00M" 1024* 1024 * 1024返回@"1.00G"
 
 @param byteCounts 文件字节数
 @return 根据传入的字节数返回一个表示该字节数大小的字符串，比如1B、1K、1.10M、1.10G
 */
- (NSString *)sc_fileSizeWithByteCounts:(NSInteger)byteCounts;


/**
 在指定的文件夹下，根据传入的前缀和文件类型，生成一个文件，文件名称的格式为 "prefix-XXXXXX.fileType",其中XXXXXX是一串不重复的随机数

 @param directoryPath 文件夹路径
 @param prefix 文件名称前缀
 @param fileType 文件类型
 @return 在指定文件夹生成的不重名的文件的路径，如果创建失败则返回nil
 */
- (NSString *)createRandomFileAtPath:(NSString *)directoryPath
                              prefix:(NSString *)prefix
                            fileType:(NSString *)fileType;
@end

NS_ASSUME_NONNULL_END
