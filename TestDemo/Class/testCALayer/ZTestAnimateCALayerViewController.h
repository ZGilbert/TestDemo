//
//  ZTestAnimateCALayerViewController.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 每一个UIView内部都默认关联着一个CALayer，我们可用称这个Layer为Root Layer（根层）。所有的非Root Layer，也就是手动创建的CALayer对象，都存在着隐式动画。
 
 * 当对非Root Layer的部分属性进行相应的修改时，默认会自动产生一些动画效果，这些属性称为Animatable Properties(可动画属性)。
 
 * 列举几个常见的Animatable Properties：
 
 bounds：用于设置CALayer的宽度和高度。修改这个属性会产生缩放动画
 backgroundColor：用于设置CALayer的背景色。修改这个属性会产生背景色的渐变动画
 position：用于设置CALayer的位置。修改这个属性会产生平移动画
 比如：假设一开始CALayer的position为(100, 100)，然后在某个时刻修改为(200, 200)，那么整个CALayer就会在短时间内从(100, 100)这个位置平移到(200, 200)
 
 * 我们也可以从官方文档中查询所有的Animatable Properties
 
 */
@interface ZTestAnimateCALayerViewController : UIViewController

@end
