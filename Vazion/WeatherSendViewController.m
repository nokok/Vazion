//
//  WeatherSendViewController.m
//  Vazion
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "WeatherSendViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface WeatherSendViewController ()

@end

@implementation WeatherSendViewController{

}

- (id)initWithNibName:(NSString *)nibNameOrUIControlStateNormal bundle:(NSBundle *)nibBundleOrUIControlStateNormal
{
    self = [super initWithNibName:nibNameOrUIControlStateNormal bundle:nibBundleOrUIControlStateNormal];
    if (self) {
        // Custom initialization
        _isWithThunderBolt = NO;
        _isWithStrongWind = NO;
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
        [_withThunderBoltButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [_withThunderBoltButton setBackgroundColor:[UIColor blackColor]];
        _isWithThunderBolt = YES;
        [_withThunderBoltButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)withStrongWindButtonPushed:(id)sender {
    if(_isWithStrongWind){
        [_withStrongWindButton setBackgroundColor:[UIColor whiteColor]];
        _isWithStrongWind = NO;
        [_withStrongWindButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [_withStrongWindButton setBackgroundColor:[UIColor blackColor]];
        _isWithStrongWind = YES;
        [_withStrongWindButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)didEndOnExit:(id)sender {
    [_textField endEditing:YES];
}

- (void)buttonColorChange:(NSString*)button{
    if([button isEqualToString:@"sunny"]){
        [_sunnyButton setBackgroundColor:[UIColor colorWithRed:0.5f green:0.0f blue:0.0f alpha:1.0f]];
        [_sunnyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if([button isEqualToString:@"cloudy"]){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_sunnyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cloudyButton setBackgroundColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
        [_cloudyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if([button isEqualToString:@"rainy"]){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_sunnyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rainyButton setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f]];
        [_rainyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}
@end
