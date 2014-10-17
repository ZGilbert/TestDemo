//
//  ZTestBlockViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-22.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestBlockViewController.h"
#import "ZSecondViewController.h"

@interface ZTestBlockViewController ()

@end

@implementation ZTestBlockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [MobClick beginLogPageView:@"PageOne"];
}

-(void) viewWillDisappear:(BOOL)animated {

    [MobClick endLogPageView:@"PageOne"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    
    self.navigationItem.title = @"string";
    
//    self.view.backgroundColor = [UIColor redColor];
    
    NSLog(@"redColor colorspace ==> %@", [UIColor redColor].CGColor);
    NSLog(@"redColor colorspace ==> %@", [UIColor blackColor].CGColor);
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    
//    navi.navigationItem.title = @"注册(1/4)";
//    self.navigationController.navigationItem.title = @"aaa";
    self.navigationController.navigationBar.titleTextAttributes = dict;
//    self.navigationBar.titleTextAttributes = dict;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 40)];
    label.text = @"i am first page";
    label.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:label];
    
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nameBtn.frame = CGRectMake(10, 170, 300, 40);
    nameBtn.backgroundColor = [UIColor redColor];
    [nameBtn setTitle:@"one" forState:UIControlStateNormal];
    [nameBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nameBtn];
    
   /* NSArray *array = @[@"abc",@"123",@23.4];
    
    if ([array writeToFile:@"text.plist" atomically:YES])
    {
        NSLog(@"success");
    }
    
    //第一种、使用属性列表进行归档
    NSArray *arr2=[NSArray arrayWithContentsOfFile:@"text.plist"];
    
    NSLog(@"%@",arr2);
    
    NSArray *array1 =[NSArray arrayWithObjects:
    
                     @"Hefeweizen", @"IPA", @"Pilsner", @"Stout",nil];
    
    NSDictionary *dictionary =[NSDictionary dictionaryWithObjectsAndKeys:
                               
                               array1, @"array", @"Stout", @"dark", @"Hefeweizen", @"wheat", @"IPA",
                               
                               @"hoppy",nil];
    
    // 得到documents directory的路径
    
    NSString  *arrPath = [NSHomeDirectory() stringByAppendingPathComponent:@"arr.plist"];
    
    NSString *dicPath=[NSHomeDirectory() stringByAppendingPathComponent:@"dic.plist"];
    
    // 保存array
    
    [array1 writeToFile:arrPath atomically:YES];
    
    
    // 保存dictionary
    
    [dictionary writeToFile:dicPath atomically:YES];
    
    
    // 从文件中读取回来
    
    NSArray *arr=[NSArray arrayWithContentsOfFile:arrPath];
    
    NSLog(@"arr is %@",arr);
    
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:dicPath];
    
    NSLog(@"dic is %@",dic);*/

    //第二、NSKeyedArchiver--对象归档，数据会加密
    // 1、对于NSArray或者NSDictionary sample code：
    
    
    /***归档对象****/
    
    NSArray *array2 = @[@"abc",@"123",@23.4];
    
    NSString *homePath = NSHomeDirectory();
    
    NSString *path = [homePath stringByAppendingPathComponent:@"test.arc"];
    
    
    
    // BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:path];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:array2 toFile:path];
    
    if (success) {
        
        ZLOG(@"archive success");
        
    }
    
    
    
    /***解归档****/
    
    NSArray *array3 =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    ZLOG(@"%@",array3);
    
    UISlider *slider= [[UISlider alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    slider.value = 0.5;
    slider.backgroundColor = [UIColor blueColor];
    [self.view addSubview:slider];
//    UISegmentedControl
    NSLog(@"%@", [[NSString alloc] initWithFormat:@"%f",slider.value]);
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(10, 270, 300, 40)];
    segment.backgroundColor = [UIColor redColor];
    [self.view addSubview:segment];
}

-(void) jump {
    
    ZSecondViewController *second = [[ZSecondViewController alloc] init];
    second.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    __block UINavigationController *navi = self.navigationController;

    [second cancelClicked:^(BOOL back) {
        [navi popViewControllerAnimated:YES];
    }];
    
    //手动实现navigation跳转动画
    /*CATransition *animation = [CATransition animation];
    animation.duration = 0.6;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromLeft;
    
    [self.navigationController.view.layer addAnimation:animation forKey:@"test"];
    [self.navigationController pushViewController:second animated:NO];*/
    
    [self.navigationController pushViewController:second animated:YES];
}

-(void) dealloc {

    NSLog(@"123456gjgj");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
