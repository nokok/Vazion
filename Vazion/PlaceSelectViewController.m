//
//  PlaceSelectViewController.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "PlaceSelectViewController.h"

@implementation PlaceSelectViewController

-(id)init{
    self = [super init];
    if(self){
        _isSearching = NO;
    }
    return self;
}

- (IBAction)searchButtonPushed:(id)sender {
    if(_isSearching){
        [_textLabel setText:@"今追加されている場所"];
        [_searchButton setTitle:@"検索" forState:UIControlStateNormal];
        _isSearching = NO;
    }else{
        [_textLabel setText:@"検索結果"];
        [_searchButton setTitle:@"中止" forState:UIControlStateNormal];
        _isSearching = YES;
    }
}

@end
