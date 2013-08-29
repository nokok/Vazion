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
    UIImage *image;
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
    SharedInstance *instance = [SharedInstance sharedManager];
    _mainMapView = instance.sharedMapView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMyLocationButtonPushed:(id)sender {
    coordinate = CLLocationCoordinate2DMake(delegate.myLatitude ,delegate.myLongitude);
    [_mainMapView setCenterCoordinate:coordinate animated:YES];
}

- (IBAction)closeButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)zoomOutButtonPushed:(id)sender {
    span.latitudeDelta = _mainMapView.region.span.latitudeDelta * 2;
    span.longitudeDelta = _mainMapView.region.span.longitudeDelta * 2;
    coordinate = _mainMapView.centerCoordinate;
    region = MKCoordinateRegionMake(coordinate,span);
    [_mainMapView setRegion:region animated:YES];
}

- (IBAction)zoomInButtonPushed:(id)sender {
    if(span.longitudeDelta * 0.5 > 0 ){
        span.latitudeDelta = span.latitudeDelta * 0.5;
        span.longitudeDelta = span.longitudeDelta * 0.5;
        coordinate = _mainMapView.centerCoordinate;
        region = MKCoordinateRegionMake(coordinate,span);
        [_mainMapView setRegion:region animated:YES];
    }
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
    annotationView.image = image;
    return annotationView;
}

@end
