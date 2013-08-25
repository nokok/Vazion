//
//  ViewController.h
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XML.h"
#import "GPS.h"
#import "AppDelegate.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureTextLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property IBOutlet UIButton *locationSelectButton;
@property Boolean isInitialized;

-(void)refreshInfomation;

@end
