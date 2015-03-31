//
//  ZTestPackageCell.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestPackageCell.h"

@implementation ZTestPackageCell


-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)configureCell:(ZItemsSource *)aItems
{
    self.textLabel.text = aItems.name;
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 40)];
    self.detailLabel.backgroundColor = [UIColor clearColor];
    self.detailLabel.text = [NSString stringWithFormat:@"%@", aItems.creationDate];
    [self addSubview:self.detailLabel];
//    self.detailTextLabel.text = [NSString stringWithFormat:@"%@", aItems.creationDate];
    NSLog(@"%@", aItems.creationDate);
}

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

+(NSString *) getDateString {
    
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSString *dateString = [formate stringFromDate:[NSDate date]];
    
    return dateString;
}

//设置高亮
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if (selected) {
//        self.backgroundColor = [UIColor grayColor];
        self.textLabel.textColor = [UIColor redColor];
    } else {
//        self.backgroundColor = [UIColor yellowColor];
//        self.textLabel.textColor = [UIColor redColor];
    }
//    self.detailLabel.backgroundColor = [UIColor redColor];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.shadowColor = [UIColor darkGrayColor];
        self.textLabel.shadowOffset = CGSizeMake(3, 3);
    }
    else {
        self.textLabel.textColor = [UIColor redColor];
        self.textLabel.shadowColor = nil;
    }
}


//自绘cell之间的线 没有数据的cell之间的线不会显示
-(void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0xE2/255.0f green:0xE2/255.0f blue:0xE2/255.0f alpha:1].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height - 1, rect.size.width, 1));
}

@end
