//
//  ViewController.m
//  TimeAndDate
//
//  Created by GG on 16/1/6.
//  Copyright © 2016年 王立广. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimeInterval timeInterval;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSTimeInterval 表示时间间隔。其他他就是一个double类型的数据。
    timeInterval = 8*60*60;

    
    //创建NSDate对象的五种常用方式
    [self creatDateObject];
    
    //时间NSDate对象的常用方法
    [self dateObjectCommonMethod];
    
    
    //时间格式器
    [self dateFormatter];
    
}


- (void)dateFormatter{
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    //    日期格式如下:
    //    y  年
    //    M  年中的月份
    //    D  当天是今年的第多少天
    //    d  月份中的天数
    //    F  月份中的周数
    //    E  星期几
    //    a  Am/pm
    //    H  一天中的小时数（0-23）
    //    k  一天中的小时数（1-24）
    //    K  am/pm 中的小时数（0-11）  Number  0
    //    h  am/pm 中的小时数（1-12）  Number  12
    //    m  小时中的分钟数  Number  30
    //    s  分钟中的秒数  Number  55
    //    S  毫秒数  Number  978
    //    z  时区  General time zone  Pacific Standard Time; PST; GMT-08:00
    //    Z  时区  RFC 822 time zone  -0800

    
    //    大写MM 表示 月
    //    小写mm 表示 分
    //    大写HH 表示 24小时制
    //    小写hh 表示 12小时制
    //    小写ss 表示 秒
    //    大写SS 表示 毫秒

    ////如果仅仅想获取当前是周几 dateFormatter.dateFormat = @"E"便可
    dateFormatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    
    /*
     * 把日期转换成字符串 [dateFormatter stringFromDate:date]
     * 将字符串转化为日期用 [dateFormatter dateFromString:<#(nonnull NSString *)#>]
     * 转换过后就自动换成系统所在时区的时间。
     */
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    
    


}


- (void)dateObjectCommonMethod{
    
    /*
     取绝对值：不区分 正负数 （无符号）
     abs(<#int#>)
     fabs(<#double#>)
     fabsf(<#float#>)
     */

    
    NSDate *date = [NSDate date];
    
    //从计算机时间(1970-01-01 00:00:00)到date时间的时间差（秒为单位）
    NSLog(@"从计算机时间(1970-01-01 00:00:00)到date时间的时间差%f",date.timeIntervalSince1970);
    
    //从(2001-01-01 00:00:00)到date时间的时间差（秒为单位）
    NSLog(@"从(2001-01-01 00:00:00)到date时间的时间差=%f",date.timeIntervalSinceReferenceDate);
    
    //从当前时间到date时间的时间差（秒为单位）
    NSLog(@"从当前时间到date时间的时间差=%f",date.timeIntervalSinceNow);
    
    //当前时间偏移多少秒后的新时间
    NSDate *tempDate = [date dateByAddingTimeInterval:timeInterval];
    NSLog(@"当前时间偏移多少秒后的新时间=%@",tempDate);
    
    //两个日期之间的时间差
    NSLog(@"两个日期之间的时间差=%f",[date timeIntervalSinceDate:tempDate]);

    //日期的比较
    NSDate *sinceNowDate = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
    NSLog(@"%@比较早", [date earlierDate:sinceNowDate]); //比较两个日期 谁早 返回早的日期
    NSLog(@"%@比较晚",[date laterDate:sinceNowDate]);    //比较两个日期 谁晚 返回晚的日期
    if (![date isEqualToDate:sinceNowDate]) {           //判断两个日期是否相等
        NSLog(@"这两个时间不相等");
    }
    
}

- (void)creatDateObject{
    
    
    //获取到GTM时间(世界标准时间),比中国时间早八个小时
    NSDate *date = [NSDate date];
    NSLog(@"当前的GTM时间=%@",date);
    
    //从当前GTM时间往后推8个小时后的时间。如果为负数就是往前推八个小时后的时间(可以算时差)
    NSDate *sinceNowDate = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
    NSLog(@"从现在GTM时间往后推8个小时后的时间=%@",sinceNowDate);
    
    //从计算机时间(1970-01-01 00:00:00)后推八个小时后的时间。如果为负数就是往前推八个小时后的时间。（可以根据时间戳获取到日期）
    NSDate *since1970Date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSLog(@"从计算机时间后推八个小时后的时间=%@",since1970Date);
    
    //从自定义的时间往后推八个小时后的时间。如果为负数就是往前推八个小时后的时间。
    NSDate *sinceCustomDate = [NSDate dateWithTimeInterval:timeInterval sinceDate:date];
    NSLog(@"%@",sinceCustomDate);
    
    //从2001-01-01 00:00:00往后推八个小时后的时间。如果为负数就是往前推八个小时后的时间。
    NSDate *sinceReferenceDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    NSLog(@"从2001-01-01 00:00:00往后推八个小时后的时间=%@",sinceReferenceDate);
    
    //永远不可能达到的一个时间点
    NSDate *futureDate = [NSDate distantFuture];
    NSLog(@"将来永远不可能到达的一个时间点=%@",futureDate);
    
    NSDate *pastDate = [NSDate distantPast];
    NSLog(@"一个无限过去的一个时间点=%@",pastDate);
    

    
}


@end
