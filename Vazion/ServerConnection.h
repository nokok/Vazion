//
//  ServerConnection.h
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConnection : NSObject

-(id)init;
-(NSArray*)getNSArrayFromAPI:(NSString *)pref;

@end
