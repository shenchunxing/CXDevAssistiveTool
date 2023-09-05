//
//  CXAssistiveURLUtil.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveURLUtil : NSObject

+ (NSString *)convertJsonFromData:(NSData *)data;

+ (NSUInteger)getRequestLength:(NSURLRequest *)request;

+ (NSUInteger)getHeadersLength:(NSDictionary *)headers;

+ (NSDictionary<NSString *, NSString *> *)getCookies:(NSURLRequest *)request ;

+ (NSUInteger)getResponseLength:(NSHTTPURLResponse *)response data:(NSData *)responseData;

+ (NSData *)getHttpBodyFromRequest:(NSURLRequest *)request;

@end

NS_ASSUME_NONNULL_END
