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
        delegate.locationSelectButton = _placementButton;
        delegate.activityIndigator = _activityIndicator;
        gps = [GPS sharedManager];
        if([gps isGPSEnabled]){
            [gps refresh];
            [gps updateMyAddress];
        }else{
            NSLog(@"GPS disabled");
        }
        delegate.xmlInstance = [XML sharedManager];
        delegate.mainViewController = self;
        _isInitialized = NO;
    }else{
        
    }
}

- (void)viewWillAppear:(BOOL)animated{
    xmlInstance = delegate.xmlInstance;
    xmlInstance.prefName = gps.prefName;
    [delegate.xmlInstance refreshDictionary:nil];
    [xmlInstance refreshInfomation];
    [_activityIndicator startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshInfomation{
    [_maxTemperatureLabel setText:[NSString stringWithFormat:@"%d",delegate.maxTemperature]];
    [_minTemperatureLabel setText:[NSString stringWithFormat:@"%d",delegate.minTemperature]];
}

@end