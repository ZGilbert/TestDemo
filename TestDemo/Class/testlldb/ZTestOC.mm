//
//  ZTestOC.m
//  TestDemo
//
//  Created by gypsii001 on 15/3/11.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestOC.h"

int g_var = 0;
int *g_pVar = &g_var;

void ZTestC::setVar(int var)
{
    int l_var = 0;
    l_var = var;
    m_var = var;
    g_var = var;
    *g_pVar = var;
}

@implementation ZTestOC

- (void)setVar:(int)var
{
    int l_var = 0;
    l_var = var;
    m_var = var;
    g_var = var;
    *g_pVar = var;
}

@end
