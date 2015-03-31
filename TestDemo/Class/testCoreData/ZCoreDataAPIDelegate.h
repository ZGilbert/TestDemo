//
//  ZCoreDataAPIDelegate.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-17.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCoreDataAPIDelegate <NSObject>

@optional
-(void) addMethod:(NSString *)name;
-(void) queryMethod:(NSString *)count;
-(void) deleteMethod:(NSString *)predicated;
-(void) updateMethod;

@end
