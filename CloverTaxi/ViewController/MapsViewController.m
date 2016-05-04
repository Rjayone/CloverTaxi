//
//  MapsViewController.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/4/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "MapsViewController.h"
#import "LocationManager.h"
#import "NetworkServiceLayer.h"
#import "Route.h"
#import "UserInfoViewController.h"
#import "Order.h"
@import GoogleMaps;

@interface MapsViewController () <UITextFieldDelegate, GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *routFromLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeToLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topInfoConstraint;

@property (strong, nonatomic) GMSMarker* startPoint;
@property (strong, nonatomic) GMSMarker* finishPoint;
@property (strong, nonatomic) GMSPolyline* polyline;

@property (strong, nonatomic) Route* route;

@end


@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GMSCameraPosition* camera = [GMSCameraPosition cameraWithTarget:[[LocationManager sharedManager]currentLocation] zoom:14];
    self.mapView.camera = camera;
    self.mapView.myLocationEnabled = YES;
    self.mapView.buildingsEnabled = YES;
    self.mapView.delegate = self;
    
    self.infoView.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:1.0].CGColor;
    self.infoView.layer.borderWidth = 0.5;
    self.infoView.layer.cornerRadius = 5.f;
    self.infoView.layer.masksToBounds = YES;
    self.infoView.alpha = 0.f;
    
    self.topInfoConstraint.constant = -250;
    
}

//------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.1647 green:0.6588 blue:0.5333 alpha:1.0];
}

#pragma mark - GoogleMapsDelegate

//------------------------------------------------------------------------------
- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    [self loadRoute:coordinate];
}


#pragma mark - Actions

//------------------------------------------------------------------------------
- (IBAction)actionConfirmRoute:(UIButton *)sender {
    UserInfoViewController* userInfoVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:NSStringFromClass([UserInfoViewController class])];
    Order* order = [[Order alloc]init];
    order.route = self.route;
    order.startPoint = self.routFromLabel.text;
    order.endPoint = self.routeToLabel.text;
    order.price = self.route.distance * tarif;
    userInfoVC.order = order;
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

//------------------------------------------------------------------------------
- (IBAction)actionCancelRoute:(UIButton *)sender {
    [self setViewAppearance:NO];
    self.finishPoint.map = nil;
    self.startPoint.map = nil;
    self.polyline.map = nil;
}


#pragma mark - Helpers

//------------------------------------------------------------------------------
- (void)processRoute:(NSArray*)route {
    [self drawRoute:route];
    
    NSDictionary* routeDict = route.firstObject;
    NSDictionary* legs = ((NSArray*)routeDict[@"legs"]).firstObject;
    
    NSString* distance = legs[@"distance"][@"text"];
    NSString* duration = legs[@"duration"][@"text"];
    
    self.routFromLabel.text = [legs[@"start_address"] componentsSeparatedByString:@", "].firstObject;
    self.routeToLabel.text = [legs[@"end_address"] componentsSeparatedByString:@", "].firstObject;
    self.distanceLabel.text = distance;
    self.durationLabel.text = duration;
    
    self.route.distance = [legs[@"distance"][@"value"] integerValue];
    self.route.duration = [legs[@"duration"][@"value"] integerValue];
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake([legs[@"start_location"][@"lat"] floatValue], [legs[@"start_location"][@"lng"] floatValue]);
    CLLocationCoordinate2D endCoord = CLLocationCoordinate2DMake([legs[@"end_location"][@"lat"] floatValue], [legs[@"end_location"][@"lng"] floatValue]);
    
    if(!self.startPoint) {
        self.startPoint = [GMSMarker markerWithPosition:startCoord];
        self.startPoint.appearAnimation = kGMSMarkerAnimationPop;
        self.startPoint.icon = [UIImage imageNamed:@"startRoute"];
        self.startPoint.map = self.mapView;
    } else {
        self.startPoint.position = startCoord;
        self.startPoint.map = self.mapView;
    }
    
    if(!self.finishPoint) {
        self.finishPoint = [GMSMarker markerWithPosition:endCoord];
        self.finishPoint.appearAnimation = kGMSMarkerAnimationPop;
        self.finishPoint.icon = [UIImage imageNamed:@"finishRoute"];
        self.finishPoint.map = self.mapView;
    } else {
        self.finishPoint.position = endCoord;
        self.finishPoint.map = self.mapView;
    }
    
    [self setViewAppearance:YES];
}

//------------------------------------------------------------------------------
- (void)drawRoute:(NSArray*)route {
    if ([route count] > 0)
    {
        NSDictionary *routeDict = [route objectAtIndex:0];
        NSDictionary *routeOverviewPolyline = [routeDict objectForKey:@"overview_polyline"];
        NSString *points = [routeOverviewPolyline objectForKey:@"points"];
        GMSPath *path = [GMSPath pathFromEncodedPath:points];
        if(!self.polyline)
            self.polyline = [[GMSPolyline alloc]init];
        
        self.polyline.path = path;
        self.polyline.strokeWidth = 3;
        self.polyline.strokeColor = [UIColor colorWithRed:0.2039 green:0.6745 blue:0.4196 alpha:1.0];
        self.polyline.map = self.mapView;
    }
}


#pragma mark - Animations

//------------------------------------------------------------------------------
- (void)setViewAppearance:(BOOL)show {
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    if(show) {
        [UIView animateWithDuration:0.35 animations:^{
            self.topInfoConstraint.constant = 28;
            self.infoView.alpha = 1;
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.35 animations:^{
            self.topInfoConstraint.constant = -180;
            self.infoView.alpha = 0.3;
            [self.view layoutIfNeeded];
        }];
    }
}


#pragma mark - Loaders

//------------------------------------------------------------------------------
- (void)loadRoute:(CLLocationCoordinate2D)coordinate {
    self.route = [[Route alloc]initWithOrigin:[LocationManager sharedManager].currentLocation andDestination:coordinate];
    
    __weak __typeof(self) wself = self;
    [[NetworkServiceLayer sharedLayer]
     googleMapsDirectionWithRoute:self.route
     success:^(NSArray *items) {
         [wself processRoute:items];
     } failure:^(NSString *request, NSError *error) {
         [wself processError:error];
     }];
}

@end
