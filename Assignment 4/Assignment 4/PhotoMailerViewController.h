//
//  ViewController.h
//  Assignment 4
//
//  Created by Tony Klose on 2/16/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PhotoMailerViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

// Public properties
@property(nonatomic, weak) IBOutlet UISegmentedControl* segmentedControl;
@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic, weak) IBOutlet UILabel* locationLabel;
@property(nonatomic, weak) IBOutlet UIButton* markItButton;
@property(nonatomic, strong) CLLocationManager* locationManager;
@property(nonatomic, strong) CLGeocoder* geocoder;

@end
