//
//  CXNetworkEnvironment.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXNetworkEnvironment.h"
#import "CXNetworkConfigur.h"
#import "CXNetworkConfigStorage.h"
#import "CXAssistiveMacro.h"
#import <CXNetworking/CXNetworking.h>

#define CX_ENV_FORMAT(a) ({ \
NSString *r = a; \
if (![a hasPrefix:@"http://"]) { \
r = [NSString stringWithFormat:@"http://%@", a]; \
} \
r; \
})

@interface CXNetworkEnvironment ()

/* CX */
@property (nonatomic, strong) CXNetworkConfigStorage *storage;

@end

@implementation CXNetworkEnvironment

+ (instancetype)sharedInstance {
    
    static CXNetworkEnvironment *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXNetworkEnvironment alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.environmentAddresses = [@[@{@"title":@"测试环境",
                                         @"address":@"http://192.168.2.16"},
                                       @{@"title":@"其他环境1",
                                         @"address":@"http://192.168.2.11"},
                                        @{@"title":@"预发环境",
                                          @"address":@"http://demo.yunchejinrong.com"},
                                       @{@"title":@"线上环境",
                                         @"address":@"http://system.yunchejinrong.com"}] mutableCopy];
    }
    return self;
}

- (void)install {
    
    [self configNetworkAddressByCache];
}

#pragma mark - 当前环境

- (void)configNetworkAddressByCache {
    
    //app，获取缓存中测试环境地址
    if ([self.storage configursForKey:kAppEnvironmentApiKey].count > 0) {
        kProjectAPIRoot = CX_ENV_FORMAT([self.storage configursForKey:kAppEnvironmentApiKey].firstObject.address);
    }else {
        kProjectAPIRoot = kCXProjectAPIRoot;
        [self addDefaultAPIAddressesForKey:kAppEnvironmentApiKey];
    }
}

- (void)addDefaultAPIAddressesForKey:(NSString *)key {
    
    CXNetworkConfigur *configur = [CXNetworkConfigur configurWithAddress:[self addressStringForApi:kCXProjectAPIRoot] remark:@"测试环境"];
    configur.selected = YES;
    [self.storage addConfigur:configur forKey:key];
    
    if (self.environmentAddresses.count > 0) {
        [self.environmentAddresses enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CXNetworkConfigur *configur = [CXNetworkConfigur configurWithAddress:[self addressStringForApi:obj[@"address"]] remark:obj[@"title"]];
            [self.storage addConfigur:configur forKey:key];
        }];
    }
}

- (NSString *)addressStringForApi:(NSString *)api {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9](.*?):(.*)[0-9]" options:0 error:nil];
    NSRange range = [regex rangeOfFirstMatchInString:api options:0 range:NSMakeRange(0, api.length)];
    if (range.length + range.location > api.length) {
        return api;
    }
    return [api substringWithRange:range];
}

- (void)switchEnvironmentForKey:(NSString *)key {
    
    CXNetworkConfigur *con = [self.storage selectedConfigurForKey:key];
    kProjectAPIRoot = CX_ENV_FORMAT(con.address);
}

#pragma mark - 环境
- (CXNetworkConfigStorage *)storage {
    
    return [CXNetworkConfigStorage sharedInstance];
}
@end
