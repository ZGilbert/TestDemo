//
//  ZTestForSthViewController.m
//  TestDemo
//
//  Created by gypsii001 on 14/12/29.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestForSthViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ZTestForSthViewController ()

@end

@implementation ZTestForSthViewController

//取相册最后一张照片
-(void)getThePhoto
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        //        if ([group numberOfAssets]==0) {
        //             [self performSelectorOnMainThread:@selector(setImagePhotoL:) withObject:nil waitUntilDone:NO];
        //        }else{
        // Chooses the photo at the last index
        @try {
            //            NSLog(@"%d",[group numberOfAssets] - 1);
            if ([group numberOfAssets] > 0) {
                [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:([group numberOfAssets] - 1)] options:0 usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
                    
                    // The end of the enumeration is signaled by asset == nil.
                    if (alAsset) {
                        UIImage *latestPhoto = [UIImage imageWithCGImage:alAsset.thumbnail];
                        
                        // Do something interesting with the AV asset.
                        [self performSelectorOnMainThread:@selector(setImagePhotoL:) withObject:latestPhoto waitUntilDone:NO];
                    }
                }];
            }
            
        }
        @catch (NSException *exception) {
            //             [self performSelectorOnMainThread:@selector(setImagePhotoL:) withObject:[UIImage imageNamed:@"camera_nophoto.png"] waitUntilDone:NO];
        }
        @finally {
            
        }
        
        //        }
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"No groups");
    }];
}

-(void)setImagePhotoL:(UIImage*) img
{
    UIButton *btn = (UIButton*)[self.view viewWithTag:1600];
    if (btn) {
        [btn setBackgroundImage:img forState:UIControlStateNormal];
    }
    
}

-(void) gotoPhotoFile {
    NSLog(@"button click");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *butTemp1 = [UIButton buttonWithType:UIButtonTypeCustom];

    butTemp1.frame = CGRectMake(0, 100, 320.0, 320.0);
    
    [butTemp1 addTarget:self action:@selector(gotoPhotoFile) forControlEvents:UIControlEventTouchUpInside];
    //    butTemp1.layer.masksToBounds = YES;
    //	butTemp1.layer.cornerRadius = 6;
    butTemp1.tag = 1600;
    [butTemp1 setBackgroundImage:[UIImage imageNamed:@"gallery_enter.png"] forState:UIControlStateNormal];
    [butTemp1 setShowsTouchWhenHighlighted:YES];
    [self.view addSubview:butTemp1];
    [self performSelectorInBackground:@selector(getThePhoto) withObject:nil];
    
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
