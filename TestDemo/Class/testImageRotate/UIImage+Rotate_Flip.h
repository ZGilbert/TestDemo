//
//  Rotate_Flip.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    enSvCropClip,               // the image size will be equal to orignal image, some part of image may be cliped
    enSvCropExpand,             // the image size will expand to contain the whole image, remain area will be transparent
};

typedef NSInteger SvCropMode;

@interface UIImage (Rotate_Flip)

- (UIImage*)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode;

@end
