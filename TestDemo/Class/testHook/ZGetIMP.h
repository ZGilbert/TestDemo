//
//  ZGetIMP.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-class.h>

/* 此为获取IMP示例 */
@interface ZGetIMP : NSObject

IMP impOfCallingMethod(id lookupObject, SEL selector);

@end
