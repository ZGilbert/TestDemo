//
//  ZIncrementlyImage.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-16.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZIncrementlyImage : UIImage

@property (strong, nonatomic) NSURL *imageURL;

- (id)initWithURL:(NSURL *)imageURL;

@end
