//
//  CXAssistiveCache.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/8.
//

#import "CXAssistiveCache.h"

static NSString * const kCXAssistiveFPSKey = @"assistive_fps";
static NSString * const kCXAssistiveCPUKey = @"assistive_cpu";
static NSString * const kCXAssistiveMemoryKey = @"assistive_memory";
static NSString * const kCXAssistiveLeakKey = @"assistive_leak";
static NSString * const kCXAssistiveLargeImageDetectionKey = @"assistive_largeImageDetection";
static NSString * const kCXAssistiveViewFrameKey = @"assistive_viewframe";
static NSString * const kCXAssistiveAPILoggerKey = @"assistive_apilogger";

@interface CXAssistiveCache ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation CXAssistiveCache

+ (CXAssistiveCache *)shareInstance {
    
    static CXAssistiveCache *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CXAssistiveCache alloc] init];
    });
    return instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)saveFPSSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveFPSKey];
}
- (BOOL)fpsSwitch {
    return [[self.userDefaults objectForKey:kCXAssistiveFPSKey] boolValue];
}

- (void)saveCPUSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveCPUKey];
}
- (BOOL)cpuSwitch {
   return [[self.userDefaults objectForKey:kCXAssistiveCPUKey] boolValue];
}

- (void)saveMemorySwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveMemoryKey];
}
- (BOOL)memorySwitch {
  return  [[self.userDefaults objectForKey:kCXAssistiveMemoryKey] boolValue];
}

- (void)saveLeakDetectionSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveLeakKey];
}
- (BOOL)leakDetectionSwitch {
   return [[self.userDefaults objectForKey:kCXAssistiveLeakKey] boolValue];
}

- (void)saveLargeImageDetectionSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveLargeImageDetectionKey];
}
- (BOOL)largeImageDetectionSwitch {
   return [[self.userDefaults objectForKey:kCXAssistiveLargeImageDetectionKey] boolValue];
}

- (void)saveViewFrameSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveViewFrameKey];
}
- (BOOL)viewFrameSwitch {
    return [[self.userDefaults objectForKey:kCXAssistiveViewFrameKey] boolValue];
}

- (void)saveAPILoggerSwitch:(BOOL)isOn {
    [self.userDefaults setObject:@(isOn) forKey:kCXAssistiveAPILoggerKey];
}
- (BOOL)APILoggerSwitch {
    return [[self.userDefaults objectForKey:kCXAssistiveAPILoggerKey] boolValue];
}

@end
