//
//  ZTestAnimationTViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/29.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestAnimationTViewController.h"

#define APP_SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define APP_SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

@interface ZTestAnimationTViewController ()
{
    UIView *upMaskView;
    UIView *downMaskView;
}
@end

@implementation ZTestAnimationTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:UITableViewIndexSearch];
    
    
    //画图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
    imageView.image = [UIImage imageNamed:@"test.png"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(128/2.f, 128/2.f)
                                                        radius:128/2.f startAngle:0 endAngle:M_PI*2.f clockwise:YES];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    imageView.layer.mask = shapeLayer;
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
    imageView1.image = [UIImage imageNamed:@"test1.png"];
    
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(128/2.f, 128/2.f)
//                                                        radius:128/2.f startAngle:0 endAngle:M_PI*2.f clockwise:YES];
    
    
    //create path
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    
//    [path1 moveToPoint:CGPointMake(175, 100)];
//    [path1 addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
//    [path1 moveToPoint:CGPointMake(150, 125)];
//    [path1 addLineToPoint:CGPointMake(150, 175)];
//    [path1 addLineToPoint:CGPointMake(125, 225)];
//    [path1 moveToPoint:CGPointMake(150, 175)];
//    [path1 addLineToPoint:CGPointMake(175, 225)];
//    [path1 moveToPoint:CGPointMake(100, 150)];
//    [path1 addLineToPoint:CGPointMake(200, 150)];
    
    
    [path1 moveToPoint:CGPointMake(200, 400)];
//    [path1 addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path1 moveToPoint:CGPointMake(300, 400)];
    [path1 addLineToPoint:CGPointMake(300, 200)];
//    [path1 addLineToPoint:CGPointMake(125, 225)];
//    [path1 moveToPoint:CGPointMake(150, 175)];
//    [path1 addLineToPoint:CGPointMake(175, 225)];
//    [path1 moveToPoint:CGPointMake(100, 150)];
//    [path1 addLineToPoint:CGPointMake(200, 150)];
    
    //create shape layer
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
//    shapeLayer1.strokeColor = [UIColor redColor].CGColor;
//    shapeLayer1.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer1.lineWidth = 5;
//    shapeLayer1.lineJoin = kCALineJoinRound;
//    shapeLayer1.lineCap = kCALineCapRound;
    shapeLayer1.path = path1.CGPath;
    
    //add it to our view
//    [self.containerView.layer addSublayer:shapeLayer];
    
//    CAShapeLayer *shapeLayer1 = [[CAShapeLayer alloc] init];
//    shapeLayer1.path = path1.CGPath;
    imageView1.layer.mask = shapeLayer1;
    [self.view addSubview:imageView1];
    
    
    
    UIActivityIndicatorView *rightActivity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 200, 30.0, 30.0)];
    rightActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    rightActivity.backgroundColor = [UIColor redColor];
    rightActivity.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:rightActivity];
    
    
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"touch" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 200, 40);
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    upMaskView = [[UIView alloc]
                   initWithFrame:CGRectMake(0.0f, -(APP_SCREEN_HEIGHT/2-10), APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT/2-10)];
    upMaskView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    upMaskView.hidden = NO;
    [self.view addSubview:upMaskView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 200, 40)];
    label.text = @"i am the label";
    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
    [self.navigationController.view addSubview:label];
    [self.navigationController.view addSubview:upMaskView];
    
    downMaskView = [[UIView alloc]
                  initWithFrame:CGRectMake(0.0f, APP_SCREEN_HEIGHT, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT/2-10)];
    downMaskView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    downMaskView.hidden = NO;
    [self.view addSubview:downMaskView];
}

- (void) touch
{
    [UIView animateWithDuration:0.3 animations:^{
        [upMaskView setCenter:CGPointMake(upMaskView.center.x,
                                             upMaskView.center.y + (APP_SCREEN_HEIGHT/2-10))];
        
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [downMaskView setCenter:CGPointMake(downMaskView.center.x,
                                          downMaskView.center.y - (APP_SCREEN_HEIGHT/2-10))];
        
    } completion:^(BOOL finished) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, APP_SCREEN_HEIGHT/2-10, APP_SCREEN_WIDTH, 20)];
        label.text = @"加载中...";
        [self.view addSubview:label];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
