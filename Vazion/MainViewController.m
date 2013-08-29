//
//  ViewController.m
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController{
@private
    GPS *gps;
    AppDelegate *delegate;
    DrkAPI *xmlInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!_isInitialized){
        delegate = [[UIApplication sharedApplication]delegate];
        delegate.mainViewController = self;
        delegate.locationSelectButton = _gpsRefreshButton;
        if([[UIScreen mainScreen] applicationFrame].size.height < 528){
            _splashView.frame = CGRectMake(160, 230, 160, 160);
        }else{
            _splashView.frame = CGRectMake(160, 230, 160, 150);
        }
        _splashSunIcon.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"sun.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          nil];
        _splashCompassIcon.animationImages = [NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"transparent.png"],
                                              [UIImage imageNamed:@"compass.png"],
                                              [UIImage imageNamed:@"transparent.png"],
                                              [UIImage imageNamed:@"transparent.png"],
                                              nil];
        _splashMoonIcon.animationImages = [NSArray arrayWithObjects:
                                           [UIImage imageNamed:@"transparent.png"],
                                           [UIImage imageNamed:@"transparent.png"],
                                           [UIImage imageNamed:@"moon.png"],
                                           [UIImage imageNamed:@"transparent.png"],
                                           nil];
        _splashCloudIcon.animationImages = [NSArray arrayWithObjects:
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"cloud.png"],
                                            nil];
        float duration = 1.5f;
        _splashSunIcon.animationDuration = duration;
        _splashCompassIcon.animationDuration = duration;
        _splashMoonIcon.animationDuration = duration;
        _splashCloudIcon.animationDuration = duration;
        
        [_splashSunIcon startAnimating];
        [_splashCompassIcon startAnimating];
        [_splashMoonIcon startAnimating];
        [_splashCloudIcon startAnimating];
        gps = [GPS sharedManager];
        if([gps isGPSEnabled]){
            [gps refresh];
            [gps updateMyAddress];
        }else{
            
        }
        delegate.sharedXmlInstance = [DrkAPI sharedManager];
        delegate.mainViewController = self;
        _isInitialized = NO;
    }else{
        //[gps refresh];
    }
}



- (void)viewWillAppear:(BOOL)animated{
    xmlInstance = delegate.sharedXmlInstance;
    xmlInstance.prefectureName = gps.prefectureName;
    [delegate.sharedXmlInstance refreshDictionary:nil];
    [xmlInstance refreshInfomation];
    [gps updateMyAddress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gpsRefreshButtonLongPushed:(id)sender {
    [gps refresh];
    [gps updateMyAddress];
    [_gpsRefreshButton setTitle:@"GPS情報を更新しました" forState:UIControlStateNormal];
    [self performSelector:@selector(refreshInfomation) withObject:nil afterDelay:5.0];
}

-(void)refreshInfomation{
    _gpsRefreshButton.enabled = YES;
    [_maxTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.maxTemperator]];
    [_minTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.minTemperator]];
    _enterSendViewButton.hidden = NO;
    [_mainWeather setText:delegate.myWeather.mainWeather];
    [_toValue setText:delegate.myWeather.toValue];
    [_nextWeather setText:delegate.myWeather.nextWeather];
    _splashView.hidden = YES;
    [_splashSunIcon stopAnimating];
    [_splashCloudIcon stopAnimating];
    [_splashMoonIcon stopAnimating];
    [_splashCompassIcon stopAnimating];
}

@end