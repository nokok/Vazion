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

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)debugButtonPushed:(id)sender {
    ServerConnection *connection = [[ServerConnection alloc] init];
    NSDictionary *dictionary = [connection getNSArrayFromAPI:@"福島県"];
    /*for(id obj in dictionary){
        NSLog(@"%@",obj);
        NSLog(@"%@",[dictionary objectForKey:obj]);
    }*/
}
@end
