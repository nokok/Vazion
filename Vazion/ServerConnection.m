//
//  ServerConnection.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "ServerConnection.h"
@class NSXMLParser;

@implementation ServerConnection{
@private
    NSDictionary *dictionary;
}

-(id)init{
    self = [super init];
    if(self){
        dictionary = @{
                       @"北海道":@"01.js",
                       @"青森県":@"02.js",
                       @"岩手県":@"03.js",
                       @"宮城県":@"04.js",
                       @"秋田県":@"05.js",
                       @"山形県":@"06.js",
                       @"福島県":@"07.js",
                       @"茨城県":@"08.js",
                       @"栃木県":@"09.js",
                       @"群馬県":@"10.js",
                       @"埼玉県":@"1.js",
                       @"千葉県":@"12.js",
                       @"東京都":@"13.js",
                       @"神奈川県":@"14.js",
                       @"新潟県":@"15.js",
                       @"富山県":@"16.js",
                       @"石川県":@"17.js",
                       @"福井県":@"18.js",
                       @"山梨県":@"19.js",
                       @"長野県":@"20.js",
                       @"岐阜県":@"21.js",
                       @"静岡県":@"22.js",
                       @"愛知県":@"23.js",
                       @"三重県":@"24.js",
                       @"滋賀県":@"25.js",
                       @"京都府":@"26.js",
                       @"大阪府":@"27.js",
                       @"兵庫県":@"28.js",
                       @"奈良県":@"29.js",
                       @"和歌山県":@"30.js",
                       @"鳥取県":@"31.js",
                       @"島根県":@"32.js",
                       @"岡山県":@"33.js",
                       @"広島県":@"34.js",
                       @"山口県":@"35.js",
                       @"徳島県":@"36.js",
                       @"香川県":@"37.js",
                       @"愛媛県":@"38.js",
                       @"高知県":@"39.js",
                       @"福岡県":@"40.js",
                       @"佐賀県":@"41.js",
                       @"長崎県":@"42.js",
                       @"熊本県":@"43.js",
                       @"大分県":@"44.js",
                       @"宮崎県":@"45.js",
                       @"鹿児島県":@"46.js",
                       @"沖縄県":@"47.js",};
    }
    return self;
}

-(NSArray*)getXMLFileFromAPI:(NSString *)prefName{
    
    NSString *urlBase = @"http://www.drk7.jp/weather/json/";
    NSString *url = [urlBase stringByAppendingString:[dictionary objectForKey:prefName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[[NSURL alloc] initWithString:url]];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *rawResponseData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSString *jsonStr = [rawResponseData stringByReplacingOccurrencesOfString:@"drk7jpweather.callback(" withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@");" withString:@""];
    
    NSError *error = nil;
    NSData *formattedData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:formattedData options:NSJSONReadingAllowFragments error:&error];
    return jsonArray;
}

-(void)parse{
    
}

@end
