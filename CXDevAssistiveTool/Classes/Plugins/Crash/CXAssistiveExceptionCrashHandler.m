//
//  CXAssistiveExceptionCrashHandler.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/10.
//

#import "CXAssistiveExceptionCrashHandler.h"
#import "CXAssistiveCrashPlugin.h"

// 记录之前的崩溃回调函数
static NSUncaughtExceptionHandler *previousUncaughtExceptionHandler = NULL;

@implementation CXAssistiveExceptionCrashHandler

+ (void)registerExceptionHandler {
    
    //获取之前注册的回调
    previousUncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&assistiveExceptionCrashHandler);
}

static void assistiveExceptionCrashHandler(NSException *exception) {
    
    [[CXAssistiveCrashPlugin sharedPlugin] saveException:exception];
    if (previousUncaughtExceptionHandler) {
        previousUncaughtExceptionHandler(exception);
    }
    kill(getpid(), SIGKILL);
}

@end
