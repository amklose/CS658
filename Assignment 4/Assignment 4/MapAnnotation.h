//
//  MapAnnotation.h
//  Assignment 4
//
//  Created by Anthony Michael Klose on 2/18/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property(nonatomic, readonly)CLLocationCoordinate2D coordinate;
@property(nonatomic, copy)NSString* title;
@property(nonatomic, copy)NSString* subtitle;

-(id)init;
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                 street:(NSString*)street
                   city:(NSString*)city;

@end
