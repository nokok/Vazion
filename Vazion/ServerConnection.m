//
//  ServerConnection.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "ServerConnection.h"

@implementation ServerConnection

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(Boolean)isConnected{
    NSString *url = @"http://weather.olp.yahooapis.jp/v1/place?coordinates=140.2755556,37.02988889&output=json&appid=dj0zaiZpPVdha1o1QWljY3BmcyZzPWNvbnN1bWVyc2VjcmV0Jng9M2I-";
    NSURLRequest *request = [NSURLRequest requestWithURL:[[NSURL alloc] initWithString:url]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error = nil;
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"items:%@",[jsonArray description]);
    return YES;
}

@end
