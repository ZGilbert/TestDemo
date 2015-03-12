//
//  ZAppDelegate.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-22.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZAppDelegate.h"
#import "HeaderFile.h"

@implementation ZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    ZLOG(@"bundleId ==> %@", bundleId);
    //友盟统计
    /*NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];

//    NSLog(@"version ==> %@", version);
    
    Class cls = NSClassFromString(@"UMANUtil");
    SEL deviceIDSelector = @selector(openUDIDString);
    NSString *deviceID = nil;
    if(cls && [cls respondsToSelector:deviceIDSelector]){
        deviceID = [cls performSelector:deviceIDSelector];
    }
    NSLog(@"{\"oid\": \"%@\"}", deviceID);
    
    [UMSocialData setAppKey:@"5428af1afd98c5bf8400dfa0"];
    
    [MobClick startWithAppkey:@"5428af1afd98c5bf8400dfa0" reportPolicy:BATCH   channelId:@"Web"];*/
    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ZTestBlockViewController *test = [[ZTestBlockViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:test];
    
    /*[ZTestHookTwo initialize];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.center = CGPointMake(160, 240);
    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventAllEvents];
    [btn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btn];*/
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)orientationChanged:(NSNotification*)notification {
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    NSString *orientationDes = nil;
    switch (orientation) {
        case UIDeviceOrientationLandscapeLeft:
            orientationDes = @"UIInterfaceOrientationLandscapeRight";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientationDes = @"UIInterfaceOrientationLandscapeLeft";
            break;
        case UIDeviceOrientationPortrait:
            orientationDes = @"UIInterfaceOrientationPortrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientationDes = @"UIInterfaceOrientationPortraitUpsideDown";
            break;
        default:
            orientationDes = @"";
            break;
    }
    
//    ZLOG(@"system ver: %@, \rorientaion: %@, \rwindow bounds: %@",
//          [UIDevice currentDevice].systemVersion,
//          orientationDes,
//          NSStringFromCGRect(self.window.bounds));
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
