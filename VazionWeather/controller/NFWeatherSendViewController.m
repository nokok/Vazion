//
//  NFWeatherSendViewController.m
//  VazionWeather
//
//  Created by noko on 2013/10/28.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "NFWeatherSendViewController.h"

@interface NFWeatherSendViewController ()

@end

@implementation NFWeatherSendViewController{
    @private
    Boolean isWithThunderbolt;
    Boolean isWithStrongwind;
    Boolean isWithHail;
    Boolean isWithFog;
    Boolean isPublic;
    Boolean isAnonymousPost;
    UIColor *selectedColor;
    UIColor *whiteColor;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    isWithThunderbolt = NO;
    isWithStrongwind = NO;
    isWithHail = NO;
    isWithFog = NO;
    isPublic = YES;
    isAnonymousPost = NO;
    selectedColor = [[UIColor alloc]initWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f];
    whiteColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)withThunderboltButtonPushed:(id)sender {
    isWithThunderbolt = !isWithThunderbolt;
    if(isWithThunderbolt){
        _thunderboltButton.backgroundColor = selectedColor;
    }else{
        _thunderboltButton.backgroundColor = whiteColor;
    }
    //hogehoge
}

- (IBAction)withStrongwindButtonPushed:(id)sender {
    isWithStrongwind = !isWithStrongwind;
    if(isWithStrongwind){
        _strongwindButton.backgroundColor = selectedColor;
    }else{
        _strongwindButton.backgroundColor = whiteColor;
    }
}

- (IBAction)withHailButtonPushed:(id)sender {
    isWithHail = !isWithHail;
    if(isWithHail){
        _hailButton.backgroundColor = selectedColor;
    }else{
        _hailButton.backgroundColor = whiteColor;
    }
}

- (IBAction)withFogButtonPushed:(id)sender {
    isWithFog = !isWithFog;
    if(isWithFog){
        _fogButton.backgroundColor = selectedColor;
    }else{
        _fogButton.backgroundColor = whiteColor;
    }
}
- (IBAction)sendButtonPushed:(id)sender {
    //NSURL *url = [[NSURL alloc] initWithString:@"http://nokok.dip.jp/"];
}

- (IBAction)addPictureButtonPushed:(id)sender {
}

- (IBAction)publishSwitchValueChanged:(id)sender {
    isPublic = !isPublic;
    if(isPublic){
        [_sendButton setTitle:@"入力した情報をサーバーに送信" forState:UIControlStateNormal];
    }else{
        [_sendButton setTitle:@"カレンダーにだけ保存" forState:UIControlStateNormal];
    }
}
@end
