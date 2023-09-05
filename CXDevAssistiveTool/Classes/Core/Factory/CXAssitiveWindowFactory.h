//
//  CXAssitiveWindowFactory.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import <Foundation/Foundation.h>
#import "CXAssistiveHomeWindow.h"
#import "CXScreenShotWindow.h"
#import "CXColorSnapWindow.h"
#import "CXNetworkEnvironmentWindow.h"
#import "CXURLPluginWindow.h"
#import "CXCrashPluginWindow.h"
#import "CXLoggerPluginWindow.h"
#import "CXMemoryLeaksPluginWindow.h"
#import "CXAppInfoPluginWindow.h"
#import "CXAssistiveDebuggerPluginWindow.h"
#import "CXLargeImagePluginWindow.h"

#import "CXAssistiveFPSPluginWindow.h"
#import "CXAssistiveCPUPluginWindow.h"
#import "CXAssistiveMemoryPluginWindow.h"
#import "CXSandBoxPluginWindow.h"
#import "CXViewHierarchyPluginWindow.h"

#import "CXAssistiveSettingPluginWindow.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXAssitiveWindowFactory : NSObject

+ (CXAssistiveHomeWindow *)pluginHomeWindow;

+ (CXScreenShotWindow *)screenShotWindow;

+ (CXColorSnapWindow *)colorSnapWindow;

+ (CXNetworkEnvironmentWindow *)networkEnvironmentWindow;

+ (CXURLPluginWindow *)urlPluginWindow;

+ (CXCrashPluginWindow *)crashPluginWindow;

+ (CXLoggerPluginWindow *)loggerPluginWindow;

+ (CXMemoryLeaksPluginWindow *)leaksPluginWindow;

+ (CXAppInfoPluginWindow *)appInfoPluginWindow;

+ (CXAssistiveDebuggerPluginWindow *)debuggerPluginWindow;

+ (CXLargeImagePluginWindow *)largeImagePluginWindow;

+ (CXAssistiveFPSPluginWindow *)fpsPluginWindow;
+ (CXAssistiveCPUPluginWindow *)cpuPluginWindow;
+ (CXAssistiveMemoryPluginWindow *)memoryPluginWindow;

+ (CXSandBoxPluginWindow *)sandBoxPluginWindow;

+ (CXViewHierarchyPluginWindow *)viewHierarchyPluginWindow;

+ (CXAssistiveSettingPluginWindow *)settingPluginWindow;
@end

NS_ASSUME_NONNULL_END
