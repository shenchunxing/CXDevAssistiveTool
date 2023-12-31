//
//  CXAppInfoUtil.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAppInfoUtil.h"
#import <sys/utsname.h>
#import <mach-o/arch.h>
#import <CoreLocation/CLLocationManager.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation CXAppInfoUtil

+ (NSString *)iphoneName {
    
    return [UIDevice currentDevice].name;
}

+ (NSString *)iphoneSystemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)screenResolution {
    return [NSString stringWithFormat:@"%ld * %ld",(long)(CGRectGetWidth([UIScreen mainScreen].bounds) * [UIScreen mainScreen].scale),(long)(CGRectGetHeight([UIScreen mainScreen].bounds) * [UIScreen mainScreen].scale)];
}

+ (NSString *)languageCode {
    return [NSLocale preferredLanguages].firstObject ?: @"Unknown";
}

+ (NSString *)batteryLevel {
    return [UIDevice currentDevice].batteryLevel != -1 ? [NSString stringWithFormat:@"%ld%%",(long)([UIDevice currentDevice].batteryLevel * 100)] : @"Unknown";
}

+ (NSString *)cpuType {
    
    return [NSString stringWithUTF8String:NXGetLocalArchInfo()->description]?:@"Unknown";
}

+ (NSString *)appName {
    
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    return infoDic[@"CFBundleDisplayName"] ?: infoDic[@"CFBundleName"] ?: @"Unknown";
}

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)bundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bundleShortVersionString {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)iphoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6S";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10.4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS MAX";
    if ([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS MAX";
    
    return platform;
}

+ (BOOL)isIPhoneXSeries {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}

+ (NSString *)locationAuthority {
    NSString *authority = @"";
    if ([CLLocationManager locationServicesEnabled]) {
        CLAuthorizationStatus state = [CLLocationManager authorizationStatus];
        if (state == kCLAuthorizationStatusNotDetermined) {
            authority = @"NotDetermined";
        }else if(state == kCLAuthorizationStatusRestricted){
            authority = @"Restricted";
        }else if(state == kCLAuthorizationStatusDenied){
            authority = @"Denied";
        }else if(state == kCLAuthorizationStatusAuthorizedAlways){
            authority = @"Always";
        }else if(state == kCLAuthorizationStatusAuthorizedWhenInUse){
            authority = @"WhenInUse";
        }
    }else{
        authority = @"NoEnabled";
    }
    return authority;
}

+ (NSString *)pushAuthority {
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
        return @"NO";
    }
    return @"YES";
}

+ (NSString *)cameraAuthority {
    NSString *authority = @"";
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    switch (authStatus) {
        case AVAuthorizationStatusNotDetermined:
            authority = @"NotDetermined";
            break;
        case AVAuthorizationStatusRestricted:
            authority = @"Restricted";
            break;
        case AVAuthorizationStatusDenied:
            authority = @"Denied";
            break;
        case AVAuthorizationStatusAuthorized:
            authority = @"Authorized";
            break;
        default:
            break;
    }
    return authority;
}

+ (NSString *)photoAuthority {
    NSString *authority = @"";
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0 //iOS 8.0以下使用AssetsLibrary.framework
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    switch (status) {
        case ALAuthorizationStatusNotDetermined:    //用户还没有选择
        {
            authority = @"NotDetermined";
        }
            break;
        case ALAuthorizationStatusRestricted:       //家长控制
        {
            authority = @"Restricted";
        }
            break;
        case ALAuthorizationStatusDenied:           //用户拒绝
        {
            authority = @"Denied";
        }
            break;
        case ALAuthorizationStatusAuthorized:       //已授权
        {
            authority = @"Authorized";
        }
            break;
        default:
            break;
    }
#else   //iOS 8.0以上使用Photos.framework
    PHAuthorizationStatus current = [PHPhotoLibrary authorizationStatus];
    switch (current) {
        case PHAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            authority = @"NotDetermined";
        }
            break;
        case PHAuthorizationStatusRestricted:       //家长控制
        {
            authority = @"Restricted";
        }
            break;
        case PHAuthorizationStatusDenied:           //用户拒绝
        {
            authority = @"Denied";
        }
            break;
        case PHAuthorizationStatusAuthorized:       //已授权
        {
            authority = @"Authorized";
        }
            break;
        default:
            break;
    }
#endif
    return authority;
}


#pragma mark 设备是否模拟器
+ (NSString *)deviceIdentifier {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (BOOL)isSimulator {
    NSString *identifier = [self deviceIdentifier];
    return [identifier isEqualToString:@"i386"] || [identifier isEqualToString:@"x86_64"];
}

@end
