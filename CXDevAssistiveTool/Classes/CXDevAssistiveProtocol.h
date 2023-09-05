//
//  CXDevAssistiveProtocol.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CXDevAssistiveProtocol <NSObject>

@optional
- (void)pluginDidLoad;

- (void)pluginDidLoad:(NSDictionary *_Nullable)data;

@end

NS_ASSUME_NONNULL_END
