//
//  ZCoreDataAPI.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-17.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCoreDataAPIDelegate.h"

@interface ZCoreDataAPI : NSObject <ZCoreDataAPIDelegate>

@property (weak, nonatomic) id<ZCoreDataAPIDelegate> delegate;

-(void) addData:(NSString *)name :(NSString *)age :(NSString *)number;
-(void) queryData;
-(void) alertActionForDelete;
-(void) updateData:(NSString *)condition;

- (void)addDelegate:(id<ZCoreDataAPIDelegate>)aDelegate;
- (void)removeDelegate:(id<ZCoreDataAPIDelegate>)aDelegate;

@end
