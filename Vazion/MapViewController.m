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
    delegate = [[UIApplication sharedApplication]delegate];
    _mapView.mapType = MKMapTypeStandard;
    NSLog(@"%f,%f",delegate.myLatitude,delegate.myLongitude);
    coordinate = CLLocationCoordinate2DMake(delegate.myLatitude ,delegate.myLongitude);
    [_mapView setCenterCoordinate:coordinate animated:YES];
    span = MKCoordinateSpanMake(0.5, 0.5);
    region = MKCoordinateRegionMake(coordinate, span);
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
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
    @try {
        NSLog(@"1");
        span.latitudeDelta = span.latitudeDelta * 2.0;
        NSLog(@"2");
        span.longitudeDelta = span.longitudeDelta * 2.0;
        NSLog(@"3");
        coordinate = _mapView.centerCoordinate;
        NSLog(@"4");
        region = MKCoordinateRegionMake(coordinate,span);
        NSLog(@"5");
        [_mapView setRegion:region animated:YES];
        NSLog(@"6");
    }
    @catch (NSException *exception) {
        
    }
}

- (IBAction)zoomInButtonPushed:(id)sender {
    span.latitudeDelta = span.latitudeDelta * 0.4;
    span.longitudeDelta = span.longitudeDelta * 0.4;
    coordinate = _mapView.centerCoordinate;
    region = MKCoordinateRegionMake(coordinate,span);
    [_mapView setRegion:region animated:YES];
}

-(void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated{
    
}

@end
