//
//  NSURLSessionConfiguration+Assistive.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "NSURLSessionConfiguration+Assistive.h"
#import <objc/runtime.h>
#import "CXAssistiveDefine.h"
#import "CXAssistiveSessionProtocol.h"

@implementation NSURLSessionConfiguration (Assistive)

#if DEBUG
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CXSwizzleInstanceMethod(object_getClass(self), @selector(defaultSessionConfiguration), @selector(assistive_defaultSessionConfiguration));
        CXSwizzleInstanceMethod(object_getClass(self), @selector(ephemeralSessionConfiguration), @selector(assistive_ephemeralSessionConfiguration));
    });
}
#endif

+ (NSURLSessionConfiguration *)assistive_defaultSessionConfiguration {
    
    NSURLSessionConfiguration *configuration = [self assistive_defaultSessionConfiguration];
    [configuration addAssistiveURLProtocol];
    return configuration;
}

+ (NSURLSessionConfiguration *)assistive_ephemeralSessionConfiguration {
    NSURLSessionConfiguration *configuration = [self assistive_ephemeralSessionConfiguration];
    [configuration addAssistiveURLProtocol];
    return configuration;
}


- (void)addAssistiveURLProtocol {
    
    if ([self respondsToSelector:@selector(protocolClasses)]
        && [self respondsToSelector:@selector(setProtocolClasses:)]) {
        NSMutableArray * urlProtocolClasses = [NSMutableArray arrayWithArray: self.protocolClasses];
        Class protoCls = CXAssistiveSessionProtocol.class;
        if (![urlProtocolClasses containsObject:protoCls]) {
            [urlProtocolClasses insertObject:protoCls atIndex:0];
        }
        self.protocolClasses = urlProtocolClasses;
    }
}

@end
