//
//  ZTestCoreDataViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-16.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCoreDataViewController.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Card.h"

#define CLEARCOLOR [UIColor clearColor]

@interface ZTestCoreDataViewController ()
{
    UITextField *nameTxt;
    UITextField *ageTxt;
    UITextField *numberTxt;
    NSManagedObjectContext *context;
}


@end

@implementation ZTestCoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 从应用程序包中加载模型文件
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    // 传入模型对象，初始化NSPersistentStoreCoordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    // 构建SQLite数据库文件的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"person.data"]];
    // 添加持久化存储库，这里使用SQLite作为存储库
    NSError *error = nil;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) { // 直接抛异常
        [NSException raise:@"添加数据库错误" format:@"%@", [error localizedDescription]];
    }
    // 初始化上下文，设置persistentStoreCoordinator属性
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
    // 用完之后，记得要[context release];
    
    [self forTxtField];
    
    [self forButton];
    
}

-(void) forTxtField
{
    nameTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 300, 40)];
    nameTxt.backgroundColor = CLEARCOLOR;
    nameTxt.placeholder = @"name";
    nameTxt.borderStyle = UITextBorderStyleRoundedRect;
    nameTxt.layer.cornerRadius = 5;
    nameTxt.delegate = self;
    [self.view addSubview:nameTxt];
    
    ageTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, 300, 40)];
    ageTxt.backgroundColor = CLEARCOLOR;
    ageTxt.placeholder = @"age";
    ageTxt.borderStyle = UITextBorderStyleRoundedRect;
    ageTxt.layer.cornerRadius = 5;
    ageTxt.delegate = self;
    [self.view addSubview:ageTxt];
    
    numberTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 180, 300, 40)];
    numberTxt.backgroundColor = CLEARCOLOR;
    numberTxt.placeholder = @"number";
    numberTxt.borderStyle = UITextBorderStyleRoundedRect;
    numberTxt.layer.cornerRadius = 5;
    numberTxt.delegate = self;
    [self.view addSubview:numberTxt];
}

-(void) forButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 230, 50, 40);
    [btn setTitle:@"增加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(100, 230, 50, 40);
    [btn1 setTitle:@"查询" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(queryh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 280, 50, 40);
    [btn2 setTitle:@"删除" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(alertActionForDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(100, 280, 50, 40);
    [btn3 setTitle:@"更新" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(updateThePersonData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

#pragma mark - 没有建立Person,Card实体类之前的方法 start
-(void) add
{
    // 传入上下文，创建一个Person实体对象
    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    // 设置Person的简单属性
    [person setValue:nameTxt.text forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:[ageTxt.text intValue]] forKey:@"age"];
    // 传入上下文，创建一个Card实体对象
    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [card setValue:numberTxt.text forKey:@"number"];
    // 设置Person和Card之间的关联关系
    [person setValue:card forKey:@"card"];
    // 利用上下文对象，将数据同步到持久化存储库
    NSError *error = nil;
    BOOL success = [context save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
    }
    // 如果是想做更新操作：只要在更改了实体对象的属性后调用[context save:&error]，就能将更改的数据同步到数据库
}

-(void) query
{
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置要查询的实体
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    // 设置排序（按照age降序）
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", @"*Itcast-1*"];
//    request.predicate = predicate;
    // 执行请求
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    // 遍历数据
    if ([objs count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"无相关数据" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    for (NSManagedObject *obj in objs) {
        ZLOG(@"name=%@, age=%@, number=%@", [obj valueForKey:@"name"], [obj valueForKey:@"age"], [[obj valueForKey:@"card"] valueForKey:@"number"]);
    }
}

-(void) alertActionForDelete
{
//    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
//    // 传入需要删除的实体对象
//    [context deleteObject:person];
//    // 将结果同步到数据库
//    NSError *error = nil;
//    [context save:&error];
//    if (error) {
//        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
//    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请问你为什么而努力" message:@"为小时候许下的诺言" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
//    UITextField *textField = [alert textFieldAtIndex:0];
//    textField.keyboardType = UIKeyboardTypeDefault;
    alert.delegate = self;
    [alert show];
}

-(void) deleteObject:(NSString *)predicatedd
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:context]];
    
    //删除谁的条件在这里配置；
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name = %@", predicatedd]];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    
    if ([results count] > 0) {
        [context deleteObject:[results objectAtIndex:0]];
//        ZLOG(@"%@",results);
    } else {
        ZLOG(@"无相关数据");
        return;
    }
    
    // 将结果同步到数据库
    [context save:&error];
    if (error) {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0) {
        
        [self deleteObjecth:[alertView textFieldAtIndex:0].text];
    }
}

- (void)updateThePersonData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:context]];
    
    //更新谁的条件在这里配置；
    NSString *theName = nameTxt.text;
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name==%@", theName]];
    
    NSError* error = nil;
    NSArray* results = [context executeFetchRequest:fetchRequest error:&error];
    
    if (results.count > 0) {
//        [context updatedObjects];
        Person *person = [results objectAtIndex:0];
        person.name = @"tomcat";
    }
    
    [context save:&error];
    if (error) {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
}

#pragma mark - 没有建立Person,Card实体类之前的方法 end

#pragma mark - 建立Person,Card实体类之后的方法 start
-(void) addh
{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    person.name = nameTxt.text;
    person.age = [NSNumber numberWithInt:[ageTxt.text intValue]];
    
    Card *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    card.number = numberTxt.text;
    person.card = card;
    // 最后调用[context save&error];保存数据
    // 利用上下文对象，将数据同步到持久化存储库
    NSError *error = nil;
    BOOL success = [context save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
    }
}

-(void) queryh
{
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置要查询的实体
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    // 设置排序（按照age降序）
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", @"*Itcast-1*"];
    //    request.predicate = predicate;
    // 执行请求
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    // 遍历数据
    if ([objs count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"无相关数据" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    for (Person *person in objs) {
        ZLOG(@"name=%@, age=%@, number=%@", person.name, person.age, person.card.number);
    }
}

-(void) deleteObjecth:(NSString *)predicatedd
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:context]];
    
    //删除谁的条件在这里配置；
    //    NSString *theName = @"tomcat";
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name = %@", predicatedd]];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    
    if ([results count] > 0) {
        [context deleteObject:[results objectAtIndex:0]];
        //        ZLOG(@"%@",results);
    } else {
        ZLOG(@"无相关数据");
        return;
    }
    
    // 将结果同步到数据库
    [context save:&error];
    if (error) {
        [NSException raise:@"删除错误" format:@"%@", [error localizedDescription]];
    }
}

#pragma mark - 建立Person,Card实体类之后的方法 end

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
