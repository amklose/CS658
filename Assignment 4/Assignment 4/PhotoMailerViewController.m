//
//  ViewController.m
//  Assignment 4
//
//  Created by Tony Klose on 2/16/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "PhotoMailerViewController.h"
#import "MapAnnotation.h"

@interface PhotoMailerViewController ()

// Private properties
@property(nonatomic, strong) CLPlacemark* placemark;
@property(nonatomic, strong) CLLocation* location;

@end

@implementation PhotoMailerViewController

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

// CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _location = [locations lastObject];
    NSLog(@"Location: %@", _location);
    [_geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count] > 0) {
            _placemark = [placemarks lastObject];
            NSLog(@"Street: %@", _placemark.thoroughfare);
            _locationLabel.text = _placemark.thoroughfare;
        }
    }];
}

-(IBAction)segmentedControllerIndexChanged:(id)sender {
    int index = (int)self.segmentedControl.selectedSegmentIndex;
    if (index == 0) {
        _mapView.mapType = MKMapTypeStandard;
    } else if (index == 1) {
        _mapView.mapType = MKMapTypeSatellite;
    } else if (index == 2) {
        _mapView.mapType = MKMapTypeHybrid;
    } else {
        NSLog(@"Index of segmented control is out of bounds: %d", index);
    }
}

-(IBAction)addPlacemarkToMap:(id)sender {
    [_mapView addAnnotation:[[MapAnnotation alloc] initWithCoordinate:_location.coordinate street:_placemark.thoroughfare city:_placemark.locality]];
}

@end
