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
        
        [[NFLocation sharedManager] updateMyGPSInfomation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonClicked:(id)sender {
    [[NFLocation sharedManager]updateMyGPSInfomation];
}

@end
