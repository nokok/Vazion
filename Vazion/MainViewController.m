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
    XML *xml;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    delegate.locationSelectButton = _placementButton;
    gps = [[GPS alloc] init];
    if([gps isGPSEnabled]){
        [gps refresh];
        [gps updateMyAddress];
    }else{
        NSLog(@"GPS disabled");
    }
    xml = [[XML alloc]init];
}

- (void)viewWillAppear:(BOOL)animated{
    xml.prefName = gps.prefName;
    NSLog(@"%@",gps.prefName);
    [xml getDictionary];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end