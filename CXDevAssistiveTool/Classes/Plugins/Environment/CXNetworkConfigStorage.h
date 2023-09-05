//
//  CXNetworkConfigStorage.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CXNetworkConfigur;
@interface CXNetworkConfigStorage : NSObject

+ (instancetype)sharedInstance;

- (void)addConfigur:(CXNetworkConfigur *)configur forKey:(NSString *)key;
- (void)removeConfigur:(CXNetworkConfigur *)configur forKey:(NSString *)key;
- (void)removeAllConfigursForKey:(NSString *)key;
- (void)setConfigurs:(NSArray <CXNetworkConfigur *> *)configurs forKey:(NSString *)key;

- (NSArray <CXNetworkConfigur *> *)configursForKey:(NSString *)key;
- (CXNetworkConfigur *)selectedConfigurForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
