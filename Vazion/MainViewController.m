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
    XML *xmlInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!_isInitialized){
        delegate = [[UIApplication sharedApplication]delegate];
        delegate.mainViewController = self;
        delegate.locationSelectButton = _locationSelectButton;
        delegate.activityIndigator = _activityIndicator;
        gps = [GPS sharedManager];
        if([gps isGPSEnabled]){
            [gps refresh];
            [gps updateMyAddress];
        }else{
            
        }
        delegate.sharedXmlInstance = [XML sharedManager];
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
    [_activityIndicator startAnimating];
    [gps updateMyAddress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshInfomation{
    //[_maxTemperatureTextLabel setText:[NSString stringWithFormat:@"%d",delegate.maxTemperature]];
    //[_minTemperatureTextLabel setText:[NSString stringWithFormat:@"%d",delegate.minTemperature]];
    [_maxTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.maxTemperator]];
    [_minTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.minTemperator]];
    NSLog(@"main:%@ to:%@ next:%@",delegate.myWeather.mainWeather,delegate.myWeather.toValue,delegate.myWeather.nextWeather);
    [_mainWeather setText:delegate.myWeather.mainWeather];
    [_toValue setText:delegate.myWeather.toValue];
    [_nextWeather setText:delegate.myWeather.nextWeather];
}

@end