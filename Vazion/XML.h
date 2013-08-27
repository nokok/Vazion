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
#import "WeatherManager.h"

@interface XML : NSObject

@property NSString *prefectureName;
@property NSDictionary *prefectureNameDictionary;
-(id)init;
-(NSDictionary*)refreshDictionary:(NSString*)prefectureName;
-(void)refreshInfomation;
+(XML*)sharedManager;
@end
