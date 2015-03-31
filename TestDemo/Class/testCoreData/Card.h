//
//  Card.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-17.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Card : NSManagedObject

@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSManagedObject *person;

@end
