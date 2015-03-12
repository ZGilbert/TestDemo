//
//  ZTestOC.h
//  TestDemo
//
//  Created by gypsii001 on 15/3/11.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

class ZTestC {
    int m_var;
    
public:
    int getVar();
    void setVar(int var);
};

@interface ZTestOC : NSObject
{
    int m_var;
}

- (void)setVar:(int)var;

@end
