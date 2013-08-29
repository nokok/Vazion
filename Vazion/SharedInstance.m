//
//  SharedInstance.m
//  Vazion
//
//  Created by noko on 2013/08/29.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "SharedInstance.h"

MKMapView *sharedMapView;

@implementation SharedInstance
+ (SharedInstance*)sharedManager {
    static SharedInstance* sharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] initSharedInstance];
    });
    return sharedSingleton;
}

- (id)initSharedInstance {
    self = [super init];
    if (self) {
        // 初期化処理
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}
@end
