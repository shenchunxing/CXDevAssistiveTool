//
//  CXNetworkConfigStorage.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXNetworkConfigStorage.h"
#import "CXNetworkConfigur.h"

static NSString *const kCXNetworkConfigurStorageSuffixKey = @"_network_configur_";

#define CX_REAL_KEY(key) [key stringByAppendingString:kCXNetworkConfigurStorageSuffixKey]

@interface CXNetworkConfigStorage ()
/* nsu */
@property (nonatomic, strong, readonly) NSUserDefaults *userDefaults;
@end
@implementation CXNetworkConfigStorage

+ (instancetype)sharedInstance {
    
    static CXNetworkConfigStorage *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXNetworkConfigStorage alloc] init];
        
    });
    return _instance;
}


- (void)setConfigurs:(NSArray <CXNetworkConfigur *> *)configurs forKey:(NSString *)key {
    
    NSParameterAssert(configurs);
    
    NSData *configurData = [NSKeyedArchiver archivedDataWithRootObject:configurs];
    [self.userDefaults setObject:configurData forKey:CX_REAL_KEY(key)];
}

- (void)addConfigur:(CXNetworkConfigur *)configur forKey:(NSString *)key {
    
    NSParameterAssert(configur);
    
    if (![configur isValid]) return;
    
    NSArray <CXNetworkConfigur *> *configurs = [self configursForKey:key] ?: @[];
    if (![configurs containsObject:configur]) {
        [self setConfigurs:[configurs arrayByAddingObject:configur] forKey:key];
    }
}

- (void)removeConfigur:(CXNetworkConfigur *)configur forKey:(NSString *)key {
    
    NSParameterAssert(configur);
    if (![configur isValid]) {
        return;
    }
    NSMutableArray <CXNetworkConfigur *> *configurs = [self configursForKey:key].mutableCopy;
    if ([configurs containsObject:configur]) {
        [configurs removeObject:configur];
        [self setConfigurs:configurs forKey:key];
    }
}

- (void)removeAllConfigursForKey:(NSString *)key {
    
    [self setConfigurs:@[] forKey:key];
}

- (NSArray <CXNetworkConfigur *> *)configursForKey:(NSString *)key {
    
    NSData *configurData = [self.userDefaults objectForKey:CX_REAL_KEY(key)];
    
    if (!configurData.length) {
        return @[];
    }
    
    NSArray *configurs = [NSKeyedUnarchiver unarchiveObjectWithData:configurData];
    
    // compat old version
    for (CXNetworkConfigur *configur in configurs) {
        if (![configur isKindOfClass:[CXNetworkConfigur class]]) {
            [self.userDefaults removeObjectForKey:CX_REAL_KEY(key)];
            return @[];
        }
    }
    
    return configurs;
}

- (CXNetworkConfigur *)selectedConfigurForKey:(NSString *)key {
    
    NSArray *configurs = [self configursForKey:key];
    for (CXNetworkConfigur *configur in configurs) {
        if (configur.isSelected) {
            return configur;
        }
    }
    return nil;
}


- (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}
@end
