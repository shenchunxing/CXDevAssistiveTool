//
//  CXNetworkEnvironment.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kCXNetworkEnvironmentSwitchNotification;

typedef NS_ENUM(NSUInteger, CXNetworkEnvironmentType) {
    CXNetworkEnvironmentTypeProject,    //测试环境，自定义
    CXNetworkEnvironmentTypeRelease,    //生产环境，配置
};

@interface CXNetworkEnvironment : NSObject

+ (instancetype)sharedInstance;

/* 可切换的环境地址 */
@property (nonatomic, strong) NSMutableArray *environmentAddresses;

/**
 安装切换环境插件
 */
- (void)install;

/**
 切换环境地址

 @param key 对应app
 */
- (void)switchEnvironmentForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
