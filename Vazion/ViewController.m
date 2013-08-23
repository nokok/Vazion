//
//  ViewController.m
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    @private
    GPS *gps;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    gps = [[GPS alloc] init];
    [gps refresh];
    [gps updateMyAddress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeDown:(id)sender {
    [gps updateMyAddress];
    NSLog(@"%@",gps.prefName);
    [_placementButton setTitle:[gps updateMyAddress] forState:UIControlStateNormal];
}
@end
