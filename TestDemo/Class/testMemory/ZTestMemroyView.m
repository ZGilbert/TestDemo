//
//  ZTestMemroyView.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-28.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestMemroyView.h"

@implementation ZTestMemroyView

dispatch_queue_t queue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
        imageView.image = [[UIImage alloc] initWithContentsOfFile:filePath];
        
        imageView.layer.contentsGravity = kCAGravityResizeAspect;
        [self addSubview:imageView];
        
        NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
        queue = dispatch_queue_create("load image", NULL);
//        queue = dispatch_queue_create("logadf", DISPATCH_QUEUE_SERIAL);
        
        __block UIImageView *testIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        dispatch_async(queue, ^{
            while (TRUE) {
                UIImage *image = [[UIImage alloc] initWithContentsOfFile:filePath2];
                testIV.image = image;
            }
        });
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
