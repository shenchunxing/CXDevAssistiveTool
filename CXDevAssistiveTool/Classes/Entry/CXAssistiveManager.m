//
//  CXAssistiveManager.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import "CXAssistiveManager.h"
#import "CXNetworkEnvironment.h"
#import "CXAssistiveCrashPlugin.h"
#import <CXLogger/CXLogger.h>
#import "CXScreenShotHelper.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveNetworkManager.h"
#import "CXLargeImageInterceptor.h"
#import "CXAssistiveLeaksManager.h"
#import "CXAssistiveCache.h"

@interface CXAssistiveManager ()

/* 避免重复 */
@property (nonatomic, assign) BOOL hasInstalled;

/* 原始window */
@property (nonatomic, strong, readwrite) UIWindow *keyWindow;
/* 辅助window */
@property (nonatomic, strong, readwrite) CXAssistiveWindow *assistiveWindow;

@property (nonatomic, strong) NSMutableArray *visibleWindows;

@end

@implementation CXAssistiveManager

+ (instancetype)sharedManager {
    
    static CXAssistiveManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXAssistiveManager alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.hasInstalled = NO;
        //支持摇一摇显示
        [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
        self.visibleWindows = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)installPlugins {
    
    //保证installPlugins只执行一次
    if (self.hasInstalled) {
        return;
    }
    self.hasInstalled = YES;
    //开启日志
    [[CXLoggerManager shareManager] startLogger];
    
    //开启crash捕捉
    [[CXAssistiveCrashPlugin sharedPlugin] install];
    
    //开启切换环境
    [[CXNetworkEnvironment sharedInstance] install];
    
    //开启网络检测
    [[CXAssistiveNetworkManager shareManager] setCanIntercept:YES];
    
    //大图检测
    BOOL isLargeImageDetectionOn = [[CXAssistiveCache shareInstance] largeImageDetectionSwitch];
    [[CXLargeImageInterceptor shareInterceptor] setCanIntercept:isLargeImageDetectionOn];
    
    //内存泄漏检测
    BOOL isLeakDetectionOn = [[CXAssistiveCache shareInstance] leakDetectionSwitch];
    [[CXAssistiveLeaksManager shareManager] setEnableLeaks:isLeakDetectionOn];
    
    //开启网络日志
    BOOL isAPILogger = [[CXAssistiveCache shareInstance] APILoggerSwitch];
    CXAPILoggerEnabled = isAPILogger;

    [[CXScreenShotHelper sharedInstance] setEnable:YES];
}

#pragma mark - public
- (void)showHomeWindow {
    [self addWindow:[CXAssitiveWindowFactory pluginHomeWindow] completion:nil];
}
- (void)showAssistive {
    [self addWindow:self.assistiveWindow completion:nil];
}

- (void)hideAssistive {
    [self removeVisibleWindow:self.assistiveWindow automaticallyShow:NO completion:nil];
}

- (void)showPluginWindow:(CXAssistiveBaseWindow *)window {
    [self showPluginWindow:window completion:nil];
}

- (void)showPluginWindow:(CXAssistiveBaseWindow *)window completion:(void(^)(void))completion {
    [self addWindow:window completion:completion];
}

- (void)addWindow:(CXAssistiveBaseWindow *)window completion:(void(^)(void))completion {
    
    if (!window) {
        return;
    }
    if (![[NSThread currentThread] isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addWindow:window completion:completion];
        });
        return;
    }
    [self removeAllVisibleWindows];
    window.hidden = NO;
    if (window == self.assistiveWindow) {
        [self.keyWindow makeKeyWindow];
        self.keyWindow = nil;
    }else {
        if (![[UIApplication sharedApplication].keyWindow isKindOfClass:[CXAssistiveBaseWindow class]]) {
            self.keyWindow = [UIApplication sharedApplication].keyWindow;
        }
        if ([window cx_canBecomeKeyWindow]) {
            [window makeKeyAndVisible];
        }else {
            [self.keyWindow makeKeyAndVisible];
            self.keyWindow = nil;
        }
    }
    [self.visibleWindows addObject:window];
    
    [UIView animateWithDuration:0.25 animations:^{
        window.alpha = 1.0;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)removeVisibleWindow:(CXAssistiveBaseWindow *)window automaticallyShow:(BOOL)isAutomaticallyShow completion:(void(^)(void))completion {
    
    if (!window) {
        return;
    }
    if (![[NSThread currentThread] isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self removeVisibleWindow:window automaticallyShow:isAutomaticallyShow completion:completion];
        });
        return;
    }
    [self.visibleWindows removeObject:window];
    if (self.visibleWindows.count == 0 && isAutomaticallyShow) {
        [self showAssistive];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        window.alpha = 0;
    } completion:^(BOOL finished) {
        window.hidden = YES;
    }];
}

- (void)removeAllVisibleWindows {
    
    for (CXAssistiveBaseWindow *window in self.visibleWindows) {
        [self removeVisibleWindow:window automaticallyShow:NO completion:nil];
    }
    [self.visibleWindows removeAllObjects];
}

#pragma mark - getter
- (CXAssistiveWindow *)assistiveWindow {
    
    if (_assistiveWindow == nil) {
        _assistiveWindow = [[CXAssistiveWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _assistiveWindow;
}
@end
