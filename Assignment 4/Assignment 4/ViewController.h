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

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic, strong) CLLocationManager* locationManager;

@end
