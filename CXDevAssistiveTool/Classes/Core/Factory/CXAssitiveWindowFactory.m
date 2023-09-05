//
//  CXAssitiveWindowFactory.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXAssitiveWindowFactory.h"

@implementation CXAssitiveWindowFactory

+ (CXAssistiveHomeWindow *)pluginHomeWindow {
    
    return (CXAssistiveHomeWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveHomeWindow.class)];
}

+ (CXScreenShotWindow *)screenShotWindow {
    return (CXScreenShotWindow *)[self createWindowWithClassName:NSStringFromClass([CXScreenShotWindow class])];
}

+ (CXColorSnapWindow *)colorSnapWindow {
    
    return (CXColorSnapWindow *)[self createWindowWithClassName:NSStringFromClass(CXColorSnapWindow.class)];
}

+ (CXNetworkEnvironmentWindow *)networkEnvironmentWindow {
    return (CXNetworkEnvironmentWindow *)[self createWindowWithClassName:NSStringFromClass(CXNetworkEnvironmentWindow.class)];
}

+ (CXURLPluginWindow *)urlPluginWindow {
    return (CXURLPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXURLPluginWindow.class)];
}

+ (CXCrashPluginWindow *)crashPluginWindow {
    return (CXCrashPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXCrashPluginWindow.class)];
}

+ (CXLoggerPluginWindow *)loggerPluginWindow {
    
    return (CXLoggerPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXLoggerPluginWindow.class)];
}

+ (CXMemoryLeaksPluginWindow *)leaksPluginWindow {
    return (CXMemoryLeaksPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXMemoryLeaksPluginWindow.class)];
}

+ (CXAppInfoPluginWindow *)appInfoPluginWindow {
    
    return (CXAppInfoPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAppInfoPluginWindow.class)];
}

+ (CXAssistiveDebuggerPluginWindow *)debuggerPluginWindow {
    
    return (CXAssistiveDebuggerPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveDebuggerPluginWindow.class)];
}

+ (CXLargeImagePluginWindow *)largeImagePluginWindow {
    
    return (CXLargeImagePluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXLargeImagePluginWindow.class)];
}

+ (CXAssistiveFPSPluginWindow *)fpsPluginWindow {
    
    return (CXAssistiveFPSPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveFPSPluginWindow.class)];
}

+ (CXAssistiveCPUPluginWindow *)cpuPluginWindow {
    
    return (CXAssistiveCPUPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveCPUPluginWindow.class)];
}

+ (CXAssistiveMemoryPluginWindow *)memoryPluginWindow {
    return (CXAssistiveMemoryPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveMemoryPluginWindow.class)];
}

+ (CXSandBoxPluginWindow *)sandBoxPluginWindow {
    
    return (CXSandBoxPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXSandBoxPluginWindow.class)];
}

+ (CXViewHierarchyPluginWindow *)viewHierarchyPluginWindow {
    
    return (CXViewHierarchyPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXViewHierarchyPluginWindow.class)];
}

+ (CXAssistiveSettingPluginWindow *)settingPluginWindow {
    
    return (CXAssistiveSettingPluginWindow *)[self createWindowWithClassName:NSStringFromClass(CXAssistiveSettingPluginWindow.class)];
}

+ (CXAssistiveBaseWindow *)createWindowWithClassName:(NSString *)className {
    NSAssert(className, ([NSString stringWithFormat:@"%@ can't register a class.",className]));
    Class cls = NSClassFromString(className);
    __block CXAssistiveBaseWindow *window = nil;
    if (![[NSThread currentThread] isMainThread]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            window = [[cls alloc] initWithFrame:[UIScreen mainScreen].bounds];
        });
    } else {
        window = [[cls alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    NSAssert([window isKindOfClass:[CXAssistiveBaseWindow class]], ([NSString stringWithFormat:@"%@ isn't a CXAssistiveBaseWindow class",className]));
    return window;
}

@end
