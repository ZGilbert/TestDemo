//
//  ZtestOperatorViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-30.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZtestOperatorViewController.h"

@interface ZtestOperatorViewController ()

@end

@implementation ZtestOperatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // test operator priority
    typedef struct
    {
        int  *next;
        
    } SturctA;
    
    int a[] = {0, 1, 2, 3};
    int b = 4;
    SturctA temp1[2];
    SturctA *pTemp1 = &temp1[0];
    int val1 = 0, val2 = 0, val3 = 0;
    
    temp1[0].next = &a[2];
    temp1[1].next = &b;
    
    val1 = *--pTemp1->next;   // equals to *(--(pTemp1->next)); after operation val1 = 1, pTemp1 = &temp1[0]
    NSLog(@"val1 value: %d", val1);
    
    val2 = *--pTemp1++->next; // equals to *(--(pTemp1->next)), then pTemp1++; after operation val2 = 0, pTemp1 = &temp1[1]
    NSLog(@"val2 value: %d", val2);
    
    val3 = *pTemp1->next;
    NSLog(@"val3 value: %d", val3);
    
    NSString *str1 = @"abc";
    NSString *str2 = @"xyz";
    NSString *appS1 = [str1 stringByAppendingString:str2];
    NSString *appS3 = [str1 stringByAppendingString:str2];
    NSString *appS2 = [str1 stringByAppendingFormat:@"%@",str2];
    if (appS1 == appS3) {
        NSLog(@"==");
    }else {
        NSLog(@"!=");
    }
    
    NSString *str = @"stringTarget";
    NSRange range = [str rangeOfString:@"arg"];
    NSLog(@"%@", NSStringFromRange(range));
    
    NSArray *array = @[@"one", @"two"];
    NSArray *appArray = [array arrayByAddingObject:@"three"];
    NSLog(@"%@", appArray);
    NSString *stringArray = [appArray componentsJoinedByString:@""];
    NSLog(@"stringArray : %@", stringArray);
    BOOL isContains = [appArray containsObject:@"three"];
    NSLog(@"isContains ==> %d", isContains);
    NSInteger abc = [appArray indexOfObject:@"three"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:@"one" forKey:@"1"];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"two", @"2", @"three", @"3", @"four", @"4", nil];
    [dict setDictionary:dict1];
    NSLog(@"dict ==> %@", dict); //会覆盖掉原来的字典
    
    NSEnumerator *enu = [dict1 keyEnumerator];
    id key;
    while (key = [enu nextObject]) {
        id object = [dict1 objectForKey:key];
    }
    
    NSSet *set1 = [NSSet setWithObjects:@"1", @"2", @"3", nil];
    NSSet *set3 = [NSSet setWithObjects:@"1", @"2", @"3", nil];
    [set1 intersectsSet:set3];
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
