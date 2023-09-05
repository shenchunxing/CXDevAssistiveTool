//
//  CXNetworkInterceptor.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CXNetworkInterceptorDelegate <NSObject>

- (BOOL)shouldInterceptor;

- (void)interceptorDidReceiveData:(NSData *)responseData task:(NSURLSessionDataTask *)task startTime:(NSTimeInterval)startTime;

@end

@interface CXNetworkInterceptor : NSObject

@property (nonatomic, assign) BOOL shouldInterceptor;

+ (instancetype)shareInterceptor;

- (void)addInterceptor:(id<CXNetworkInterceptorDelegate>)interceptor;
- (void)removeInterceptor:(id<CXNetworkInterceptorDelegate>)interceptor;
- (void)interceptorDidReceiveData:(NSData *)responseData task:(NSURLSessionDataTask *)task startTime:(NSTimeInterval)startTime;
@end

NS_ASSUME_NONNULL_END
