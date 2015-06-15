//
//  ZTestCountCacheViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/6/15.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestCountCacheViewController.h"

@interface ZTestCountCacheViewController ()

@end

@implementation ZTestCountCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZLOG(@"== =>%.f", [self folderSizeAtPath:[self getCachesPath]]);
}

-(NSString *)getCachesPath{
    // 获取Caches目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    NSString *filePath = [cachesDir stringByAppendingPathComponent:@"com.nickcheng.NCMusicEngine"];
    
    return filePath;
}
///计算缓存文件的大小的M
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        
//        //取得一个目录下得所有文件名
//        NSArray *files = [manager subpathsAtPath:filePath];
//        NSLog(@"files1111111%@ == %ld",files,files.count);
//
//        // 从路径中获得完整的文件名（带后缀）
//        NSString *exe = [filePath lastPathComponent];
//        NSLog(@"exeexe ====%@",exe);
//
//        // 获得文件名（不带后缀）
//        exe = [exe stringByDeletingPathExtension];
//
//        // 获得文件名（不带后缀）
//        NSString *exestr = [[files objectAtIndex:1] stringByDeletingPathExtension];
//        NSLog(@"files2222222%@  ==== %@",[files objectAtIndex:1],exestr);
        
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
}

- (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];//从前向后枚举器／／／／//
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSLog(@"fileName ==== %@",fileName);
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        NSLog(@"fileAbsolutePath ==== %@",fileAbsolutePath);
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    NSLog(@"folderSize ==== %lld",folderSize);
    return folderSize/(1024.0*1024.0);
}
////////////
-(void)ss{
    // 获取Caches目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    NSLog(@"cachesDircachesDir == %@",cachesDir);
    //读取缓存里面的具体单个文件/或全部文件//
    NSString *filePath = [cachesDir stringByAppendingPathComponent:@"com.nickcheng.NCMusicEngine"];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSLog(@"filePathfilePath%@ ==array==== %@",filePath, array);
    
    
    NSFileManager* fm=[NSFileManager defaultManager];
    if([fm fileExistsAtPath:filePath]){
        //取得一个目录下得所有文件名
        NSArray *files = [fm subpathsAtPath:filePath];
        NSLog(@"files1111111%@ == %ld",files,(unsigned long)files.count);
        
        // 获得文件名（不带后缀）
        NSString * exestr = [[files objectAtIndex:1] stringByDeletingPathExtension];
        NSLog(@"files2222222%@  ==== %@",[files objectAtIndex:1],exestr);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
