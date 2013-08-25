//
//  ServerConnection.h
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLReader.h"
#import "AppDelegate.h"

@interface XML : NSObject

@property NSString *prefName;
@property NSDictionary *prefectureNameDictionary;
-(id)init;
-(NSDictionary*)refreshDictionary:(NSString*)prefName;
-(void)refreshInfomation;
+(XML*)sharedManager;
@end
