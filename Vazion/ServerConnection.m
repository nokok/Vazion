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

-(id)getNSArrayFromAPI:(NSString *)prefName{
    
    NSString *urlBase = @"http://www.drk7.jp/weather/xml/";
    NSString *url = [urlBase stringByAppendingString:[dictionary objectForKey:prefName]];
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:[[NSURL alloc] initWithString:url]];
    [parser setDelegate:self];
    [parser parse];
    return parser;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"解析を開始しました");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"エラーが発生しました");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	NSLog(@"要素[%@]が見つかりました", elementName);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	NSLog(@"要素[%@]が終わりました", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	NSLog(@"文字列[%@]が見つかりました", string);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"解析が完了しました");
}

@end
