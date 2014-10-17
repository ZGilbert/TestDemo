//
//  ZTestCALayerViewController.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-11.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 UIView内部默认有个CALayer对象(层)，通过layer属性可以访问这个层。要注意的是，这个默认的层不允许重新创建，但可以往层里面添加子层
 UIView可以通过addSubview:方法添加子视图，类似地，CALayer可以通过addSublayer:方法添加子层
 */

/*
  为什么CALayer中使用CGColorRef和CGImageRef这2种数据类型，而不用UIColor和UIImage？
 
 * 首先要知道：CALayer是定义在QuartzCore框架中的；CGImageRef、CGColorRef两种数据类型是定义在CoreGraphics框架中的；UIColor、UIImage是定义在UIKit框架中的
 
 * 其次，QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OS X上都能使用，但是UIKit只能在iOS中使用
 
 * 因此，为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef
 
 * 不过很多情况下，可以通过UIKit对象的特定方法，得到CoreGraphics对象，比如UIImage的CGImage方法可以返回一个CGImageRef
 */

/*
 UIView和CALayer的选择
 
 2个效果不仅可以通过添加层来实现，还可以通过添加UIView来实现。比如，第1个红色的层可以用一个UIView来实现，第2个显示图片的层可以用一个UIImageView来实现。 既然CALayer和UIView都能实现相同的显示效果，那究竟该选择谁好呢？
 
 * 其实，对比CALayer，UIView多了一个事件处理的功能。也就是说，CALayer不能处理用户的触摸事件，而UIView可以
 
 * 所以，如果显示出来的东西需要跟用户进行交互的话，用UIView；如果不需要跟用户进行交互，用UIView或者CALayer都可以
 
 * 当然，CALayer的性能会高一些，因为它少了事件处理的功能，更加轻量级
 
 */

/*
 UIView和CALayer的其他关系
 
 * UIView可以通过subviews属性访问所有的子视图，类似地，CALayer也可以通过sublayers属性访问所有的子层
 
 * UIView可以通过superview属性访问父视图，类似地，CALayer也可以通过superlayer属性访问父层
 
 * 如果两个UIView是父子关系，那么它们内部的CALayer也是父子关系。
 
 */
@interface ZTestCALayerViewController : UIViewController

@end
