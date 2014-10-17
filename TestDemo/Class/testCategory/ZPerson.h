//
//  ZPerson.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-8.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPerson : NSObject
{
  @private
    NSString *_name;
    int _age;
}

-(void) test;

@end

@interface ZPerson (Creation)

//类方法
+(id) personWithName:(NSString *)aName;
+(id) personWithName:(NSString *)aName withAge:(int)aAge;

//...

-(id) initWithName:(NSString *)aName;
-(id) initWithName:(NSString *)aName withAge:(int)aAge;

@end