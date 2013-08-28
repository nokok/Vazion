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
    UIColor *defaultButtonColor;
    UIColor *white;
    UIColor *black;
    UIColor *selectedButtonColor;
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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    defaultButtonColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.0f];
    white = [UIColor whiteColor];
    black = [UIColor blackColor];
    selectedButtonColor = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
    _isWithThunderBolt = NO;
    _isWithStrongWind = NO;
    _isWithSnow = NO;
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
        _weather = @"";
    }
}

- (IBAction)cloudyButtonPushed:(id)sender {
    if(![_weather isEqualToString:@"C"]){
        [self buttonColorChange:CLOUDY];
        _weather = @"C";
    }else{
        _weather = @"";
    }
}

- (IBAction)rainyButtonPushed:(id)sender {
    if(![_weather isEqualToString:@"R"]){
        [self buttonColorChange:RAINY];
        _weather = @"R";
    }else{
        _weather = @"";
    }
}

- (IBAction)withThunderBoltButtonPushed:(id)sender {
    if(_isWithThunderBolt){
        [_withThunderBoltButton setBackgroundColor:defaultButtonColor];
        _isWithThunderBolt = NO;
    }else{
        [_withThunderBoltButton setBackgroundColor:selectedButtonColor];
        _isWithThunderBolt = YES;
    }
}

- (IBAction)withStrongWindButtonPushed:(id)sender {
    if(_isWithStrongWind){
        [_withStrongWindButton setBackgroundColor:defaultButtonColor];
        _isWithStrongWind = NO;
    }else{
        [_withStrongWindButton setBackgroundColor:selectedButtonColor];
        _isWithStrongWind = YES;
    }
}

- (IBAction)withSnowButtonPushed:(id)sender {
    if(_isWithSnow){
        [_withSnowButton setBackgroundColor:defaultButtonColor];
        _isWithSnow = NO;
    }else{
        [_withSnowButton setBackgroundColor:selectedButtonColor];
        _isWithSnow = YES;
    }
}

- (IBAction)closeButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendButtonPushed:(id)sender {
    NSLog(@"sendButtonPushed Method Call");
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    NSString *requestURL = [NSString stringWithFormat:@"http://nokok.dip.jp/~noko/Weather.php?w=%@&sw=%d&th=%d&sn=%d&ms=%@&lat=%f&lon=%f"
                            ,_weather
                            ,_isWithStrongWind?1:0
                            ,_isWithThunderBolt?1:0
                            ,_isWithSnow?1:0
                            ,@""
                            ,delegate.myLatitude
                            ,delegate.myLongitude
                            ];
    
    requestURL = [requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"%@",responseData);
    [_sendButton setTitle:@"投票完了!" forState:UIControlStateNormal]  ;
    [_sendButton setBackgroundColor:[UIColor colorWithRed:0.3f green:0.3f blue:0.6f alpha:1.0f]];
    [_closeButton setBackgroundColor:[UIColor colorWithRed:0.6f green:0.3f blue:0.3f alpha:1.0f]];
    [self buttonColorReset];
}

- (void)buttonColorChange:(WeatherStatus)button{
    if(button == SUNNY){
        [_sunnyButton setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.4f alpha:1.0f]];
        [_cloudyButton setBackgroundColor:defaultButtonColor];
        [_rainyButton setBackgroundColor:defaultButtonColor];
    }else if(button == CLOUDY){
        [_sunnyButton setBackgroundColor:defaultButtonColor];
        [_cloudyButton setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
        [_rainyButton setBackgroundColor:defaultButtonColor];
    }else if(button == RAINY){
        [_sunnyButton setBackgroundColor:defaultButtonColor];
        [_cloudyButton setBackgroundColor:defaultButtonColor];
        [_rainyButton setBackgroundColor:[UIColor colorWithRed:0.4f green:0.6f blue:0.9f alpha:1.0f]];
    }
}

- (void)buttonColorReset{
    [_sunnyButton setBackgroundColor:defaultButtonColor];
    [_cloudyButton setBackgroundColor:defaultButtonColor];
    [_rainyButton setBackgroundColor:defaultButtonColor];
    _weather = @"";
}

@end
