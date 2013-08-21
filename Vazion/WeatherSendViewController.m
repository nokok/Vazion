//
//  WeatherSendViewController.m
//  hoge
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
        // Initialization code here.
        _isWithThunderbolt = NO;
        _isWithStrongWind = NO;
    }
    return self;
}

- (IBAction)sunnyButtonPushed:(id)sender {
    _weather = @"Sunny";
    [self buttonColorChange:@"sunny"];
}

- (IBAction)rainyButtonPushed:(id)sender {
    _weather = @"Rainy";
    [self buttonColorChange:@"rainy"];
}

- (IBAction)cloudyButtonPushed:(id)sender {
    _weather = @"Cloudy";
    [self buttonColorChange:@"cloudy"];
}

- (IBAction)withThunderboltButtonPushed:(id)sender {
    _isWithThunderbolt = !_isWithThunderbolt;
}

- (IBAction)withStrongWIndButtonPushed:(id)sender {
    _isWithStrongWind = !_isWithStrongWind;
}

- (IBAction)backButtonPushed:(id)sender {
}

- (IBAction)sendButtonPushed:(id)sender {
    //送信処理
}

- (void)buttonColorChange:(NSString *)buttonName{
    if([buttonName isEqual: @"sunny"]){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setBackgroundColor:_view.backgroundColor];
        [_cloudyButton setBackgroundColor:_view.backgroundColor];
    }else if([buttonName isEqualToString:@"rainy"]){
        [_sunnyButton setBackgroundColor:_view.backgroundColor];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setBackgroundColor:_view.backgroundColor];
    }else if([buttonName isEqualToString:@"cloudy"]){
        [_sunnyButton setBackgroundColor:_view.backgroundColor];
        [_rainyButton setBackgroundColor:_view.backgroundColor];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
    }
    return;
}
@end
