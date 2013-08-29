//
//  ViewController.m
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController{
@private
    GPS *gps;
    AppDelegate *delegate;
    DrkAPI *xmlInstance;
    CLLocationCoordinate2D coordinate;
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    Boolean isMapViewInitialized;
    UIImage *image;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!_isInitialized){
        delegate = [[UIApplication sharedApplication]delegate];
        delegate.mainViewController = self;
        delegate.locationSelectButton = _gpsRefreshButton;
        if([[UIScreen mainScreen] applicationFrame].size.height < 528){
            _splashView.frame = CGRectMake(160, 230, 160, 160);
        }else{
            _splashView.frame = CGRectMake(160, 230, 160, 150);
        }
        _splashSunIcon.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"sun.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          [UIImage imageNamed:@"transparent.png"],
                                          nil];
        _splashCompassIcon.animationImages = [NSArray arrayWithObjects:
                                              [UIImage imageNamed:@"transparent.png"],
                                              [UIImage imageNamed:@"compass.png"],
                                              [UIImage imageNamed:@"transparent.png"],
                                              [UIImage imageNamed:@"transparent.png"],
                                              nil];
        _splashMoonIcon.animationImages = [NSArray arrayWithObjects:
                                           [UIImage imageNamed:@"transparent.png"],
                                           [UIImage imageNamed:@"transparent.png"],
                                           [UIImage imageNamed:@"moon.png"],
                                           [UIImage imageNamed:@"transparent.png"],
                                           nil];
        _splashCloudIcon.animationImages = [NSArray arrayWithObjects:
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"transparent.png"],
                                            [UIImage imageNamed:@"cloud.png"],
                                            nil];
        float duration = 1.5f;
        _splashSunIcon.animationDuration = duration;
        _splashCompassIcon.animationDuration = duration;
        _splashMoonIcon.animationDuration = duration;
        _splashCloudIcon.animationDuration = duration;
        
        [_splashSunIcon startAnimating];
        [_splashCompassIcon startAnimating];
        [_splashMoonIcon startAnimating];
        [_splashCloudIcon startAnimating];
        gps = [GPS sharedManager];
        if([gps isGPSEnabled]){
            [gps refresh];
            [gps updateMyAddress];
        }else{
            
        }
        delegate.sharedXmlInstance = [DrkAPI sharedManager];
        delegate.mainViewController = self;
        _isInitialized = NO;
    }else{
        //[gps refresh];
    }
}

-(void)mapInitialize{
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
        double randomNumX = fabs(sin(rand()%180)) * 0.01;
        double randomNumY = fabs(sin(rand()%180)) * 0.01;
        weatherInfo.latitude = [[separatedResult objectAtIndex:0]doubleValue] + randomNumX - (randomNumY * 2.0);
        weatherInfo.longitude = [[separatedResult objectAtIndex:1]doubleValue] + randomNumY - (randomNumX * 2.0);
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
                image = [UIImage imageNamed:@"sun_color.png"];
                break;
            case CLOUDY:
                annotation.title = @"くもりです";
                image = [UIImage imageNamed:@"cloud_color.png"];
                break;
            case RAINY:
                annotation.title = @"雨です";
                image = [UIImage imageNamed:@"umbrella_color.png"];
                break;
            default:
                annotation.title = @"天気が入力されていません";
                image = [UIImage imageNamed:@"transparent.png"];
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
        [_overlayedMapView addAnnotation:annotation];
        _overlayedMapView.delegate = self;
    }
    
    delegate = [[UIApplication sharedApplication]delegate];
    _overlayedMapView.mapType = MKMapTypeStandard;
    coordinate = CLLocationCoordinate2DMake(delegate.myLatitude ,delegate.myLongitude);
    [_overlayedMapView setCenterCoordinate:coordinate animated:YES];
    span = MKCoordinateSpanMake(0.2, 0.2);
    region = MKCoordinateRegionMake(coordinate, span);
    region.span.latitudeDelta = 0.2;
    region.span.longitudeDelta = 0.2;
    [_overlayedMapView setRegion:region animated:YES];
    _overlayedMapView.showsUserLocation = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    xmlInstance = delegate.sharedXmlInstance;
    xmlInstance.prefectureName = gps.prefectureName;
    [delegate.sharedXmlInstance refreshDictionary:nil];
    [xmlInstance refreshInfomation];
    [gps updateMyAddress];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if(annotation == mapView.userLocation){
        return nil;
    }
    
    MKAnnotationView *annotationView;
    NSString *identifier = @"Pin";
    annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(nil == annotationView){
        annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    NSLog(@"%@",[image autorelease);
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.alpha = 0.2f;
    annotationView.image = imageView.image;
    return annotationView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gpsRefreshButtonLongPushed:(id)sender {
    [gps refresh];
    [gps updateMyAddress];
    [_gpsRefreshButton setTitle:@"GPS情報を更新しました" forState:UIControlStateNormal];
    [self performSelector:@selector(refreshInfomation) withObject:nil afterDelay:5.0];
}

-(void)refreshInfomation{
    if(!isMapViewInitialized){
        [self mapInitialize];
        isMapViewInitialized = YES;
    }
    _overlayedMapView.showsUserLocation = YES;
    _gpsRefreshButton.enabled = YES;
    [_maxTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.maxTemperator]];
    [_minTemperatureTextLabel setText:[NSString stringWithFormat:@"%d", delegate.myWeather.minTemperator]];
    _enterSendViewButton.hidden = NO;
    [_mainWeather setText:delegate.myWeather.mainWeather];
    [_toValue setText:delegate.myWeather.toValue];
    [_nextWeather setText:delegate.myWeather.nextWeather];
    _splashView.hidden = YES;
    [_splashSunIcon stopAnimating];
    [_splashCloudIcon stopAnimating];
    [_splashMoonIcon stopAnimating];
    [_splashCompassIcon stopAnimating];
}

@end