//
//  CXAppInfoUtil.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAppInfoUtil : NSObject

+ (NSString *)iphoneName;

+ (NSString *)iphoneSystemVersion;

+ (NSString *)screenResolution;

+ (NSString *)languageCode;

+ (NSString *)batteryLevel;

+ (NSString *)cpuType;

+ (NSString *)appName;

+ (NSString *)bundleIdentifier;

+ (NSString *)bundleVersion;

+ (NSString *)bundleShortVersionString;

+ (NSString *)iphoneType;

+ (BOOL)isIPhoneXSeries;

+ (NSString *)locationAuthority;

+ (NSString *)pushAuthority;

+ (NSString *)cameraAuthority;

+ (NSString *)photoAuthority;

/// 设备是否模拟器
+ (BOOL)isSimulator;

@end

NS_ASSUME_NONNULL_END
