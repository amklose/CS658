//
//  ViewController.m
//  Assignment 4
//
//  Created by Tony Klose on 2/16/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "ViewController.h"
#import "MapAnnotation.h"

@interface ViewController ()

@property(nonatomic, strong) CLPlacemark* placemark;
@property(nonatomic, strong) CLLocation* location;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    _geocoder = [[CLGeocoder alloc] init];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MKMapViewDelegate
-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _locationLabel.text = userLocation.location.description;
}

// CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _location = [locations lastObject];
    NSLog(@"Location: %@", _location);
}

-(IBAction)segmentedControllerIndexChanged:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
            
        case 1:
            _mapView.mapType = MKMapTypeSatellite;
            break;
        
        case 2:
            _mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

-(IBAction)addPlacemarkToMap:(id)sender {
    MapAnnotation* annotation = [[MapAnnotation alloc] initWithCoordinate:_location.coordinate street:_placemark.locality city:_placemark.locality];
    [_mapView addAnnotation:annotation];
}

-(void)reverseGeocodeLocation:(CLLocation*) location
{
    [_geocoder reverseGeocodeLocation:location completionHandler: ^(NSArray* placemarks, NSError* error) {
        _placemark = [placemarks objectAtIndex:0];
    }];
}

@end
