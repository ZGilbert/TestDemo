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

-(void) testforPhotoAtLast;

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

-(void) testforPhotoAtLast
{
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

-(void) sthcase {
    //    BOOL bol1 = [UIScreen instancesRespondToSelector:@selector(currentMode)];
    //    BOOL bol2 = CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size);
    //    BOOL bol = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
    
    NSMutableString *s = [NSMutableString stringWithString:@"the quick brown fox jumps over the lazy dog"];
//    int strLen = [s length];
    for (int i = 0; i < [s length]; i++) {
        int a = [s characterAtIndex:i];
        if (a == 32) {
            NSRange range;
            range = NSMakeRange(i, 1);
            [s deleteCharactersInRange:range];
//            strLen -= 1;
        }
    }
//    ZLOG(@"s ==> %@", s);
    
    NSMutableString *result = [NSMutableString string];
    
    for (int i = 0; i < [s length]-1; i++) {
        int a = [s characterAtIndex:i];
        int b = [s characterAtIndex:i+1];
        if (a < b) {
//            NSRange range = NSMakeRange(i, 1);
//            [s deleteCharactersInRange:range];
            [result appendFormat:@"%c", [s characterAtIndex:i]];
        }
    }
    ZLOG(@"result ==> %@", result);
    
    UIImage *image = [UIImage imageNamed:@"test"];
}

/* =================================================================== */
-(UIImage *) getImageFromImage
{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = CGRectMake(10.0, 10.0, 57.0, 57.0);
    UIImage* bigImage= [UIImage imageNamed:@"test.png"];
    
    CGImageRef imageRef = bigImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size;
    size.width = 57.0;
    size.height = 57.0;
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;

}

-(void)testContextRef {
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //画一个正方形图形 没有边框
//    CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
//    CGContextFillRect(context, CGRectMake(2, 2, 270, 270));
//    CGContextStrokePath(context);
//    
//    //写文字
//    CGContextSetLineWidth(context, 1.0);
//    CGContextSetRGBFillColor (context,  1, 1, 1, 1.0);
//    UIFont  *font = [UIFont boldSystemFontOfSize:11.0];
//    [@"fangyp" drawInRect:CGRectMake(40, 40, 80, 20) withFont:font];
//    
//    //画一条线
//    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
//    CGContextMoveToPoint(context, 20, 20);
//    CGContextAddLineToPoint(context, 200,20);
//    CGContextStrokePath(context);
//    
//    //画正方形边框
//    CGContextSetRGBStrokeColor(context, 1, 1.0, 1.0, 1.0);
//    CGContextSetLineWidth(context, 2.0);
//    CGContextAddRect(context, CGRectMake(2, 2, 270, 270));
//    CGContextStrokePath(context);
//    
//    
//    //画方形背景颜色
//    
//    CGContextTranslateCTM(context, 0.0f, self.view.bounds.size.height);
//    CGContextScaleCTM(context, 1.0f, -1.0f);
//    UIGraphicsPushContext(context);
//    CGContextSetLineWidth(context,320);
//    CGContextSetRGBStrokeColor(context, 250.0/255, 250.0/255, 210.0/255, 1.0);
//    CGContextStrokeRect(context, CGRectMake(0, 0, 320, 460));
//    UIGraphicsPopContext();

//    CGPDFDocumentCreateWithProvider(<#CGDataProviderRef provider#>)
}

-(void) startImageAnimating {

    UIImageView *animationImgV = (UIImageView *)[self.view viewWithTag:100];
    [animationImgV startAnimating];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 20, 20);
    [button addTarget:self action:@selector(startImageAnimating) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIImageView *playAni = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    playAni.tag = 100;
    playAni.userInteractionEnabled = NO;
    NSArray *_animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"msg_left_1.png"],
                      [UIImage imageNamed:@"msg_left_2.png"],
                      [UIImage imageNamed:@"msg_left_3.png"],
                      nil];
    
    [playAni setAnimationImages:_animationImages];
    playAni.animationDuration = 2;
    if ([_animationImages count])
    {
        playAni.image = [_animationImages lastObject];
    }
    
    playAni.animationRepeatCount = 0;
    [button addSubview:playAni];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 90, 40, 40);
    button1.backgroundColor = [UIColor clearColor];
    [button1 addTarget:self action:@selector(startImageAnimating) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
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
