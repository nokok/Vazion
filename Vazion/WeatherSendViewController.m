//
//  WeatherSendViewController.m
//  Vazion
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "WeatherSendViewController.h"

@interface WeatherSendViewController ()

@end

@implementation WeatherSendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isWithThunderBolt = NO;
        _isWithStrongWind = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoading");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"viewDidLoaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sunnyButtonPushed:(id)sender {
    [self buttonColorChange:@"sunny"];
}

- (IBAction)cloudyButtonPushed:(id)sender {
    [self buttonColorChange:@"cloudy"];
}

- (IBAction)rainyButtonPushed:(id)sender {
    [self buttonColorChange:@"rainy"];
}

- (IBAction)withThunderBoltButtonPushed:(id)sender {
    if(_isWithThunderBolt){
        [_withThunderBoltButton setBackgroundColor:[UIColor whiteColor]];
        _isWithThunderBolt = NO;
    }else{
        [_withThunderBoltButton setBackgroundColor:[UIColor blackColor]];
        _isWithThunderBolt = YES;
    }
}

- (IBAction)withStrongWindButtonPushed:(id)sender {
    if(_isWithStrongWind){
        [_withStrongWindButton setBackgroundColor:[UIColor whiteColor]];
        _isWithStrongWind = NO;
    }else{
        [_withStrongWindButton setBackgroundColor:[UIColor blackColor]];
        _isWithStrongWind = YES;
    }
}

- (void)buttonColorChange:(NSString*)button{
    if([button isEqualToString:@"sunny"]){
        [_sunnyButton setBackgroundColor:[UIColor blackColor]];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
    }else if([button isEqualToString:@"cloudy"]){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setBackgroundColor:[UIColor blackColor]];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
    }else if([button isEqualToString:@"rainy"]){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setBackgroundColor:[UIColor blackColor]];
    }
}
@end
