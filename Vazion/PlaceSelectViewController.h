//
//  PlaceSelectViewController.h
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PlaceSelectViewController : UIViewController

@property Boolean isSearching;
@property (weak, nonatomic) IBOutlet UITableView *addedListView;
@property (weak, nonatomic) IBOutlet UITableView *searchListView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)searchButtonPushed:(id)sender;
- (IBAction)closeButtonPushed:(id)sender;

@end
