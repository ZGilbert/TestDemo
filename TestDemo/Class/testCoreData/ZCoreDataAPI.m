//
//  ZCoreDataAPI.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-17.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZCoreDataAPI.h"
#import <CoreData/CoreData.h>
#import "Person.h"

@interface ZCoreDataAPI () <UIAlertViewDelegate>

@end

@implementation ZCoreDataAPI
{
    NSMutableArray *delegates;
}

@synthesize delegate;

dispatch_queue_t concurrentQueue;

-(id) init
{
    self = [super init];
    if (self) {
        concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
        delegates = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addDelegate:(id<ZCoreDataAPIDelegate>)aDelegate
{
    dispatch_barrier_async(concurrentQueue, ^{
        [delegates addObject:aDelegate];
    });
}

- (void)removeDelegate:(id<ZCoreDataAPIDelegate>)aDelegate
{
    [delegates removeObject:aDelegate];
}

-(void) addData:(NSString *)name :(NSString *)age :(NSString *)number
{
    NSManagedObjectContext *context = [self forContext];
    
    // 传入上下文，创建一个Person实体对象
    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    // 设置Person的简单属性
    [person setValue:name forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:[age intValue]] forKey:@"age"];
    // 传入上下文，创建一个Card实体对象
    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [card setValue:number forKey:@"number"];
    // 设置Person和Card之间的关联关系
    [person setValue:card forKey:@"card"];
    // 利用上下文对象，将数据同步到持久化存储库
    NSError *error = nil;
    BOOL success = [context save:&error];
    if (!success) {
        [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
        return;
    }
    // 如果是想做更新操作：只要在更改了实体对象的属性后调用[context save:&error]，就能将更改的数据同步到数据库
    for (id<ZCoreDataAPIDelegate> d in delegates) {
        if ([d respondsToSelector:@selector(addMethod:)]) {
            [d performSelector:@selector(addMethod:) withObject:name];
        }
    }
}

-(void) queryData
{
    NSManagedObjectContext *context = [self forContext];
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
    for (id<ZCoreDataAPIDelegate> d in delegates) {
        if ([d respondsToSelector:@selector(queryMethod:)]) {
            [d performSelector:@selector(queryMethod:) withObject:[NSString stringWithFormat:@"%d", (unsigned)[objs count]]];
        }
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
    NSManagedObjectContext *context = [self forContext];
    
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
        return;
    }
    for (id<ZCoreDataAPIDelegate> d in delegates) {
        if ([d respondsToSelector:@selector(deleteMethod:)]) {
            [d performSelector:@selector(deleteMethod:) withObject:predicatedd];
        }
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        
        [self deleteObject:[alertView textFieldAtIndex:0].text];
    }
}

-(void) updateData:(NSString *)condition
{
    NSManagedObjectContext *context = [self forContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:context]];
    
    //更新谁的条件在这里配置；
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name==%@", condition]];
    
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
    
    for (id<ZCoreDataAPIDelegate> d in delegates) {
        if ([d respondsToSelector:@selector(updateMethod)]) {
            [d performSelector:@selector(updateMethod)];
        }
    }
    
}

-(NSManagedObjectContext *) forContext
{
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
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
    // 用完之后，记得要[context release];
    return context;
}

@end



