//
//  NFWeather.m
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "NFWeather.h"

@implementation NFWeather{
    @private
    NSDictionary *prefectureNameDictionary;
}

-(id)initSharedInstance{
    self = [super init];
    if(self){
        [NFLocation sharedManager].delegate = self;
        prefectureNameDictionary = @{
                                     @"北海道":@"01.xml",
                                     @"青森県":@"02.xml",
                                     @"岩手県":@"03.xml",
                                     @"宮城県":@"04.xml",
                                     @"秋田県":@"05.xml",
                                     @"山形県":@"06.xml",
                                     @"福島県":@"07.xml",
                                     @"茨城県":@"08.xml",
                                     @"栃木県":@"09.xml",
                                     @"群馬県":@"10.xml",
                                     @"埼玉県":@"11.xml",
                                     @"千葉県":@"12.xml",
                                     @"東京都":@"13.xml",
                                     @"神奈川県":@"14.xml",
                                     @"新潟県":@"15.xml",
                                     @"富山県":@"16.xml",
                                     @"石川県":@"17.xml",
                                     @"福井県":@"18.xml",
                                     @"山梨県":@"19.xml",
                                     @"長野県":@"20.xml",
                                     @"岐阜県":@"21.xml",
                                     @"静岡県":@"22.xml",
                                     @"愛知県":@"23.xml",
                                     @"三重県":@"24.xml",
                                     @"滋賀県":@"25.xml",
                                     @"京都府":@"26.xml",
                                     @"大阪府":@"27.xml",
                                     @"兵庫県":@"28.xml",
                                     @"奈良県":@"29.xml",
                                     @"和歌山県":@"30.xml",
                                     @"鳥取県":@"31.xml",
                                     @"島根県":@"32.xml",
                                     @"岡山県":@"33.xml",
                                     @"広島県":@"34.xml",
                                     @"山口県":@"35.xml",
                                     @"徳島県":@"36.xml",
                                     @"香川県":@"37.xml",
                                     @"愛媛県":@"38.xml",
                                     @"高知県":@"39.xml",
                                     @"福岡県":@"40.xml",
                                     @"佐賀県":@"41.xml",
                                     @"長崎県":@"42.xml",
                                     @"熊本県":@"43.xml",
                                     @"大分県":@"44.xml",
                                     @"宮崎県":@"45.xml",
                                     @"鹿児島県":@"46.xml",
                                     @"沖縄県":@"47.xml",};
    }
    return self;
}

+(NFWeather*)sharedManager{
    static NFWeather* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[NFWeather alloc]initSharedInstance];
    });
    return sharedInstance;
}

- (id)init{
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (void)addressUpdated:(NSString *)address
              prefName:(NSString *)prefName
              cityName:(NSString *)cityName{
    if([prefectureNameDictionary objectForKey:prefName] == nil){
        NSLog(@"hoge");
        return;
    }
    NSURL *url = [NSURL URLWithString:[NSString
                                       stringWithFormat:@"%@%@",@"http://www.drk7.jp/weather/xml/",
                                       [prefectureNameDictionary objectForKey:prefName]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *fetchedXMLData = [NSURLConnection
                              sendSynchronousRequest:request
                              returningResponse:nil
                              error:nil];
    NSLog(@"%@",fetchedXMLData);
}

@end
