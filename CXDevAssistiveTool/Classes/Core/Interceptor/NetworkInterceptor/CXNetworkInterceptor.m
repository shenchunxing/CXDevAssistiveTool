//
//  CXNetworkInterceptor.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXNetworkInterceptor.h"

@interface CXNetworkInterceptor ()

@property (nonatomic, strong) NSMutableSet *listeners;

@end

@implementation CXNetworkInterceptor

+ (instancetype)shareInterceptor {
    
    static CXNetworkInterceptor *_intance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _intance = [[CXNetworkInterceptor alloc] init];
    });
    return _intance;
}

- (BOOL)shouldInterceptor {
    
    BOOL shouldInterceptor = NO;
    for (id<CXNetworkInterceptorDelegate> delegate in self.listeners) {
        if ([delegate shouldInterceptor]) {
            shouldInterceptor = YES;
        }
    }
    return shouldInterceptor;
}

- (void)addInterceptor:(id<CXNetworkInterceptorDelegate>)interceptor {
    [self.listeners addObject:interceptor];
}

- (void)removeInterceptor:(id<CXNetworkInterceptorDelegate>)interceptor {
    [self.listeners removeObject:interceptor];
}

- (void)interceptorDidReceiveData:(NSData *)responseData task:(NSURLSessionDataTask *)task startTime:(NSTimeInterval)startTime {
    for (id<CXNetworkInterceptorDelegate> delegate in self.listeners) {
        if ([delegate respondsToSelector:@selector(interceptorDidReceiveData:task:startTime:)]) {
            [delegate interceptorDidReceiveData:responseData task:task startTime:startTime];
        }
    }
}

- (NSMutableSet *)listeners {
    
    if (!_listeners) {
        _listeners = [[NSMutableSet alloc] init];
    }
    return _listeners;
}

@end
