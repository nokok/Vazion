//
//  MapViewController.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController{
    CLLocationCoordinate2D coordinate;
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    AppDelegate *delegate;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *url = @"http://nokok.dip.jp/~noko/Get.php";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *responseString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSMutableArray *resultSet = [[NSMutableArray alloc] initWithArray:[responseString componentsSeparatedByString:@"<br>"]];
    [resultSet removeLastObject];
    NSMutableArray *weatherInfoArray;
    NSLog(@"items:%@",[resultSet description]);
    
    for(NSString *result in resultSet){
        NSArray *separatedResult = [result componentsSeparatedByString:@","];
        WeatherInfo *weatherInfo = [[WeatherInfo alloc]init];
        weatherInfo.latitude = [[separatedResult objectAtIndex:0]doubleValue];
        weatherInfo.longitude = [[separatedResult objectAtIndex:1]doubleValue];
        weatherInfo.weather = (WeatherStatus)[[separatedResult objectAtIndex:2]intValue];
        weatherInfo.isWithThunderbolt = [[separatedResult objectAtIndex:3]boolValue];
        weatherInfo.isWithStrongWind = [[separatedResult objectAtIndex:4]boolValue];
        weatherInfo.isWithSnow = [[separatedResult objectAtIndex:5]boolValue];
        weatherInfo.timestamp = [separatedResult objectAtIndex:6];
        [weatherInfoArray addObject:weatherInfo];
        CustomAnnotation *annotation = [[CustomAnnotation alloc]init];
        annotation.coordinate = CLLocationCoordinate2DMake(weatherInfo.latitude, weatherInfo.longitude);
        
        switch ((int)weatherInfo.weather) {
            case SUNNY:
                annotation.title = @"晴れです";
                annotation.image = [UIImage imageNamed:@"sun.png"];
                break;
            case CLOUDY:
                annotation.title = @"くもりです";
                annotation.image = [UIImage imageNamed:@"cloud.png"];
                break;
            case RAINY:
                annotation.title = @"雨です";
                annotation.image = [UIImage imageNamed:@"umbrella.png"];
                break;
            default:
                annotation.title = @"天気が入力されていません";
                annotation.image = [UIImage imageNamed:@"transparent.png"];
                break;
        }
        annotation.subtitle = @"";
        
        if(weatherInfo.isWithThunderbolt){
            annotation.subtitle = @"落雷";
        }
        if(weatherInfo.isWithStrongWind){
            annotation.subtitle = [NSString stringWithFormat:@"%@ %@",annotation.subtitle,@"強風"];
        }
        if(weatherInfo.isWithSnow){
            annotation.subtitle = [NSString stringWithFormat:@"%@ %@",annotation.subtitle,@"降雪"];
        }
        [_mapView addAnnotation:annotation];
        _mapView.delegate = self;
    }
    
    NSLog(@"data:%@",[resultSet description]);
    
    delegate = [[UIApplication sharedApplication]delegate];
    _mapView.mapType = MKMapTypeStandard;
    coordinate = CLLocationCoordinate2DMake(delegate.myLatitude ,delegate.myLongitude);
    [_mapView setCenterCoordinate:coordinate animated:YES];
    span = MKCoordinateSpanMake(0.2, 0.2);
    region = MKCoordinateRegionMake(coordinate, span);
    region.span.latitudeDelta = 0.2;
    region.span.longitudeDelta = 0.2;
    [_mapView setRegion:region animated:YES];
    _mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMyLocationButtonPushed:(id)sender {
    coordinate = CLLocationCoordinate2DMake(delegate.myLatitude ,delegate.myLongitude);
    [_mapView setCenterCoordinate:coordinate animated:YES];
}

- (IBAction)closeButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)zoomOutButtonPushed:(id)sender {
    span.latitudeDelta = _mapView.region.span.latitudeDelta * 2;
    span.longitudeDelta = _mapView.region.span.longitudeDelta * 2;
    coordinate = _mapView.centerCoordinate;
    region = MKCoordinateRegionMake(coordinate,span);
    [_mapView setRegion:region animated:YES];
}

- (IBAction)zoomInButtonPushed:(id)sender {
    if(span.longitudeDelta * 0.5 > 0 ){
        span.latitudeDelta = span.latitudeDelta * 0.5;
        span.longitudeDelta = span.longitudeDelta * 0.5;
        coordinate = _mapView.centerCoordinate;
        region = MKCoordinateRegionMake(coordinate,span);
        [_mapView setRegion:region animated:YES];
    }
}

-(void)getAnnotation{
    
}

@end
