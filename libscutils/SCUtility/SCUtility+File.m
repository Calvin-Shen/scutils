//
//  SCUtility+File.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility+File.h"
@implementation SCUtility (File)
- (NSUInteger)sc_fileSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:path])
    {
        NSUInteger size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size;
    }
    SCLog(@"文件不存在");
    return 0;
}

- (NSString *)sc_fileSizeWithByteCounts:(NSInteger)byteCounts
{
    // 1k = 1024, 1m = 1024k
    if (byteCounts < 1024)
    { // 小于1k
        return [NSString stringWithFormat:@"%ldB", (long)byteCounts];
    }
    else if (byteCounts < 1024 * 1024)
    { // 小于1m
        CGFloat aFloat = byteCounts / 1024.0;
        return [NSString stringWithFormat:@"%.0fK", aFloat];
    }
    else if (byteCounts < 1024 * 1024 * 1024)
    { // 小于1G
        CGFloat aFloat = byteCounts / (1024.0 * 1024.0);
        return [NSString stringWithFormat:@"%.2fM", aFloat];
    }
    else
    {
        CGFloat aFloat = byteCounts / (1024.0 * 1024.0 * 1024.0);
        return [NSString stringWithFormat:@"%.2fG", aFloat];
    }
}

- (NSString *)createRandomFileAtPath:(NSString *)directoryPath prefix:(NSString *)prefix fileType:(NSString *)fileType;
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if ([fileManager fileExistsAtPath:directoryPath isDirectory:&isDir] && isDir)
    {
        NSString *fileName = [[prefix stringByAppendingString:@"-XXXXXX"] stringByAppendingPathExtension:fileType];
        NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
        size_t    len      = strlen(fileType.UTF8String);
        size_t    lenTotal = strlen(filePath.UTF8String);
        char      c_FileName[lenTotal];
        char *    begin          = strcpy(c_FileName, filePath.UTF8String);
        int       fileDescriptor = mkstemps(begin, (int)(len + 1));
        assert(fileDescriptor != -1);
        NSString *tempFileTemplate = [NSString stringWithUTF8String:begin];
        return tempFileTemplate;
    }
    else
    {
        return nil;
    }
}
@end
