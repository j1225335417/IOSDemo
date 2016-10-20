//
//  LocationHandler.h
//  IOSDemo
//
//  Created by niuhome_vip on 16/10/12.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationHandlerDelegate <NSObject>

@required
-(void) didUpdateToLocation:(CLLocation*)newLocation
               fromLocation:(CLLocation*)oldLocation;
@end
@interface LocationHandler : NSObject<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;

}


@property(nonatomic,strong) id<LocationHandlerDelegate> delegate;

+(id)getSharedInstance;
-(void)startUpdating;
-(void) stopUpdating;
@end
