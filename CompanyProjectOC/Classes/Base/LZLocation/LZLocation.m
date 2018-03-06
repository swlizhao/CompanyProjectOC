//
//  LZLocation.m
//  CompanyProjectOC


#import "LZLocation.h"

@interface LZLocation () <CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager * lzLocationManager;
@property(nonatomic,strong)CLGeocoder * geocoder;
@property(nonatomic,copy)void (^getLocationBlock)(BOOL isLocation,NSString * country ,NSString *province, NSString *city ,NSString * area,NSString * address,NSString * nearlyPlace);
@end

@implementation LZLocation

+ (LZLocation *)getLocation {
    static LZLocation * lzLocation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lzLocation = [[LZLocation alloc]init];
    });
    return lzLocation;
}

- (void)lzConfig {
    self.lzLocationManager = [[CLLocationManager  alloc]init];
    self.lzLocationManager.delegate = self;
    self.lzLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.geocoder = [[CLGeocoder alloc] init];
    BOOL locationServerEnable = [CLLocationManager locationServicesEnabled];
    CLAuthorizationStatus authorizationStatus =   [CLLocationManager authorizationStatus];
//    NSLog(@"授权状态lz:%d",authorizationStatus);
//    NSLog(@"locationServerEnable:%d",locationServerEnable);
    if ([self.lzLocationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.lzLocationManager requestAlwaysAuthorization];
    }
    
}

- (void)startGetLocationResult:(void(^)(BOOL isLocation,NSString * country ,NSString *province, NSString *city ,NSString * area,NSString * address,NSString * nearlyPlace))locationResultBlock {
    [self.lzLocationManager startUpdatingLocation];
    _getLocationBlock = locationResultBlock;
}

- (void)stopLocation {
    [self.lzLocationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation * location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSString * latitudeStr = [NSString stringWithFormat:@"%f",coordinate.latitude];
    if (latitudeStr && ![latitudeStr isEqualToString:@""]) {
        [self stopLocation];
        [self reverseGeocoder:coordinate];
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    if (error.code == kCLErrorDenied) {
        NSLog(@"位置服务被禁用");
        self.getLocationBlock(NO,@"", @"", @"", @"", @"", @"");
    }
    NSLog(@"我被调用...");
}

- (void)reverseGeocoder:(CLLocationCoordinate2D)coordinate {
    CLLocation * location = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error) {
            return;
        }
        CLPlacemark * placemark = [placemarks lastObject];
        NSString * country;
        NSString * province;
        NSString * city;
        NSString * area;
        NSString * address;
        NSString * nearlyPlace;
        country = placemark.country;
        province = placemark.administrativeArea;
        city = placemark.locality;
        area = placemark.subLocality;
        address = placemark.thoroughfare;
        nearlyPlace = placemark.name;
        self.getLocationBlock(YES,country, province, city, area, address, nearlyPlace);
    }];
}

- (void)lzLocationDealloc {
    _lzLocationManager = nil;
    _geocoder = nil;
    _lzLocationManager.delegate = nil;
}

@end
