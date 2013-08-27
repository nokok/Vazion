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

@implementation WeatherSendViewController{
@private
    UIColor *buttonTextColor;
    UIColor *selectedButtonTextColor;
}

typedef enum WeatherStatus : NSInteger {
    SUNNY,
    CLOUDY,
    RAINY,
} WeatherStatus;

- (id)initWithNibName:(NSString *)nibNameOrUIControlStateNormal bundle:(NSBundle *)nibBundleOrUIControlStateNormal
{
    self = [super initWithNibName:nibNameOrUIControlStateNormal bundle:nibBundleOrUIControlStateNormal];
    if (self) {
        // Custom initialization
        _isWithThunderBolt = NO;
        _isWithStrongWind = NO;
        _isWithSnow = NO;
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
    if(![_weather isEqualToString:@"S"]){
        [self buttonColorChange:SUNNY];
        _weather = @"S";
    }else{
        [self buttonColorReset];
    }
}

- (IBAction)cloudyButtonPushed:(id)sender {
    [self buttonColorChange:CLOUDY];
    _weather = @"C";
}

- (IBAction)rainyButtonPushed:(id)sender {
    [self buttonColorChange:RAINY];
    _weather = @"R";
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

- (IBAction)withSnowButtonPushed:(id)sender {
    if(_isWithSnow){
        [_withSnowButton setBackgroundColor:[UIColor whiteColor]];
        [_withSnowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _isWithSnow = NO;
    }else{
        [_withSnowButton setBackgroundColor:[UIColor blackColor]];
        [_withSnowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _isWithSnow = YES;
    }
}

- (IBAction)closeButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendButtonPushed:(id)sender {
    NSLog(@"sendButtonPushed Method Call");
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    NSString *messageText = ([_textField.text isEqualToString:@""])?@"nocomment":_textField.text;
    
    NSString *requestURL = [NSString stringWithFormat:@"http://nokok.dip.jp/~noko/Weather.php?w=%@&sw=%d&th=%d&sn=%d&ms=%@&lat=%f&lon=%f"
                            ,_weather
                            ,_isWithStrongWind?1:0
                            ,_isWithThunderBolt?1:0
                            ,_isWithSnow?1:0
                            ,messageText
                            ,delegate.myLatitude
                            ,delegate.myLongitude
                            ];
    
    NSLog(@"%@",requestURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"%@",responseData);
}

- (void)buttonColorChange:(WeatherStatus)button{
    if(button == SUNNY){
        [_sunnyButton setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.4f alpha:1.0f]];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
    }else if(button == CLOUDY){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setBackgroundColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
        [_rainyButton setBackgroundColor:[UIColor whiteColor]];
    }else if(button == RAINY){
        [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
        [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
        [_rainyButton setBackgroundColor:[UIColor colorWithRed:0.4f green:0.6f blue:0.9f alpha:1.0f]];
    }
}

- (void)buttonColorReset{
    [_sunnyButton setBackgroundColor:[UIColor whiteColor]];
    [_cloudyButton setBackgroundColor:[UIColor whiteColor]];
    [_rainyButton setBackgroundColor:[UIColor whiteColor]];
    _weather = @"";
}

@end
