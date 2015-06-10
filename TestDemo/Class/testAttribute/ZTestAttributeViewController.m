//
//  ZTestAttributeViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/6/1.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestAttributeViewController.h"

@interface ZTestAttributeViewController ()

@end

struct p
{
    
    int a; //4
    
    char b; //1
    
    short c; //1
    
}__attribute__((aligned(4))) pp;

struct m
{
    
    char a; //1
    
    int b; //4
    
    short c; //2
    
}__attribute__((aligned(4))) mm;

struct o
{
    
    int a;
    
    char b;
    
    short c;
    
}oo;

struct x
{
    
    int a; //4
    
    char b; //1
    
    struct p px; //7
    
    short c; //2
    
}__attribute__((aligned(8))) xx;

/*
 $gcc –Wall –c noreturn.c
 noreturn.c: In function `test':
 noreturn.c:12: warning: control reaches end of non-void function
 
 警告信息也很好理解，因为你定义了一个有返回值的函数test却有可能没有返回值，程序当然不知道怎么办了！
 加上__attribute__((noreturn))则可以很好的处理类似这种问题。把
 extern void myexit();修改为：
 extern void myexit() __attribute__((noreturn));之后，编译不会再出现警告信息。
 __attribute__ const
 该属性只能用于带有数值类型参数的函数上。当重复调用带有数值参数的函数时，由于返回值是相同的，所以此时编译器可以进行优化处理，除第一次需要运算外， 其它只需要返回第一次的结果就可以了，进而可以提高效率。该属性主要适用于没有静态状态（static state）和副作用的一些函数，并且返回值仅仅依赖输入的参数。
 为了说明问题，下面举个非常“糟糕”的例子，该例子将重复调用一个带有相同参数值的函数，具体如下：
 
 extern int square(int n) __attribute__     ((const));...                  for (i = 0; i < 100; i++ )                  {       total += square (5) + i;             }
 通过添加__attribute__((const))声明，编译器只调用了函数一次，以后只是直接得到了相同的一个返回值。
 
 事实上，const参数不能用在带有指针类型参数的函数中，因为该属性不但影响函数的参数值，同样也影响到了参数指向的数据，它可能会对代码本身产生严重甚至是不可恢复的严重后果。
 并且，带有该属性的函数不能有任何副作用或者是静态的状态，所以，类似getchar（）或time（）的函数是不适合使用该属性的。
 
 
 __attribute__((constructor))
 
 __attribute__((destructor))
 解释一下：__attribute__((constructor)) 在main() 之前执行,__attribute__((destructor)) 在main()执行结束之后执行.
 
 
 
 需要说明的是，__attribute__适用于函数的声明而不是函数的定义。所以，当需要使用该属性的函数时，必须在同一个文件里进行声明,如下
 */
extern int square(int n) __attribute__((const));
extern int square(int n) {
    return n*n;
}

__attribute__((const)) extern int sum(int a, int b) {
    return a+b;
}

@implementation ZTestAttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    printf("sizeof(int)=%d,sizeof(short)=%d.sizeof(char)=%d\n",(int)sizeof(int),(int)sizeof(short),(int)sizeof(char));
    
    printf("pp=%d,mm=%d \n", (int)sizeof(pp),(int)sizeof(mm));
    
    printf("oo=%d,xx=%d \n", (int)sizeof(oo),(int)sizeof(xx));
    
    printf("int=%d \n", (int)sizeof(int));
    
    printf("char=%d \n", (int)sizeof(char));
    
    printf("short=%d \n", (int)sizeof(short));
    
    int total = 0;
    for (int i = 0; i < 100; i++ ) {
        total += square (5) + i;
    }
    printf("total ==> %d \n", total);
    
//    exit(1)
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
