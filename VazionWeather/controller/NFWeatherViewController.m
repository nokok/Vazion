//
//  NFWeatherViewController.m
//  VazionWeather
//
//  Created by noko on 2013/10/28.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "NFWeatherViewController.h"

@interface NFWeatherViewController ()
@end

@implementation NFWeatherViewController{
    NFLocation *location;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NFLocation *locationInstance = [NFLocation sharedManager];
    locationInstance.delegate = self;
    NFWeather *weatherInstance = [NFWeather sharedManager];
    weatherInstance.delegate = self;
    [locationInstance updateMyGPSInfomation];
    [_addressLabel setText:@"取得中..."];
    [_activityIndicator startAnimating];
    [_weatherImageView layer].magnificationFilter = kCAFilterNearest;
}

- (IBAction)updateButtonClicked:(id)sender {
    [[NFLocation sharedManager]updateMyGPSInfomation];
}

- (void)didUpdate{
    [_addressLabel setText:[NSString stringWithFormat:@"%@%@",[NFLocation sharedManager].myAddress,@"の天気"]];
}

- (void)gpsInfomationUpdating{
    [_addressLabel setText:@"GPS測位中..."];
    [_activityIndicator startAnimating];
}

- (void)gpsInfomationUpdated{
    [_addressLabel setText:@"住所を取得しています..."];
}

- (void)addressUpdated:(NSString *)address prefName:(NSString *)prefName cityName:(NSString *)cityName{
    [_addressLabel setText:address];
    //[_addressLabel setText:[NSString stringWithFormat:@"%@%@",address,@"の天気"]];
    [_updateTimeLabel setText:[self getDate]];
    [_activityIndicator stopAnimating];
    [[NFWeather sharedManager] fetchXMLData:prefName];
}

- (NSString*)getDate{
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags = NSMonthCalendarUnit | NSDayCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *dateComponents = [calendar components:flags fromDate:now];
    
    return [NSString stringWithFormat:@"%d月%d日 %d:%d:%d %@",
            (int)dateComponents.month,
            (int)dateComponents.day,
            (int)dateComponents.hour,
            (int)dateComponents.minute,
            (int)dateComponents.second,
            @"に更新しました"];
}

- (void)weatherInfomationFetched:(NSString *)weather img:(UIImage *)image maxTemp:(NSString*)maxTemp minTemp:(NSString*)minTemp rainProbablity:(NSString*)rainProb{
    if(maxTemp == nil){
        [_weatherLabel setText:@"国内専用です"];
        [_rainProbablityLabel setText:@"---"];
        [_temprature setText:@"---℃ ---℃"];
    }else{
        [_weatherLabel setText:weather];
        [_weatherImageView setImage:image];
        [_rainProbablityLabel setText:[NSString stringWithFormat:@"%@%%",rainProb]];
        [_temprature setText:[NSString stringWithFormat:@"%@℃ / %@℃",maxTemp,minTemp]];
    }
}

@end
