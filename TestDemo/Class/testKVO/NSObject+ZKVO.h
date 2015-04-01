//
//  NSObject+ZKVO.h
//  TestDemo
//
//  Created by gypsii001 on 15/4/1.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZB_observerBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (ZKVO)

- (void) ZB_addObserver:(NSObject *)observer
           forKeyPath:(NSString *)keyPath
            withBlock:(ZB_observerBlock)block;

-(void) ZB_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end
