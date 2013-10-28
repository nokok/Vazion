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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NFLocation *locationInstance = [NFLocation sharedManager];
    locationInstance.delegate = self;
    [locationInstance updateMyGPSInfomation];
    [_addressLabel setText:@"取得中..."];
    [_activityIndicator startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [_addressLabel setText:[NSString stringWithFormat:@"%@%@",address,@"の天気"]];
    [_updateTimeLabel setText:@"たった今"];
    [_activityIndicator stopAnimating];
}

@end
