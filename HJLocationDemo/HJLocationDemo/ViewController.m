//
//  ViewController.m
//  HJLocationDemo
//
//  Created by huangjiong on 16/4/9.
//  Copyright © 2016年 huangjiong. All rights reserved.
//
/**
 *  初始化项目
 *
 */

#import "ViewController.h"
//定位只需要这个框架
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()<CLLocationManagerDelegate>

//定位管理器
@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation ViewController

#pragma mark - 
-(CLLocationManager *)locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        //代理,通过代理方法获取各种定位信息
        _locationManager.delegate = self;
        //每隔多少米定位一次
        _locationManager.distanceFilter = 100;
        //精确度
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 开始定位
- (IBAction)startUpdateLocation:(id)sender
{
    //开始定位
    [self.locationManager startUpdatingLocation];
}



#pragma mark - CLLocationManagerDelegate
//定位管理器代理方法
//定位成功
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"定位成功");
    
    //停止定位
    [self.locationManager stopUpdatingLocation];
}

//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败");
    NSLog(@"错误信息:%@",error);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
