//
//  CXNetworkConfigureItem.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXNetworkConfigurItem.h"
#import "CXNetworkConfigur.h"
#import "CXNetworkConfigStorage.h"

@implementation CXNetworkConfigurItem

+ (instancetype)configurItemWithTitle:(NSString *)title identifier:(NSString *)identifier {
    
    CXNetworkConfigurItem *item = [[CXNetworkConfigurItem alloc] init];
    item.title = title;
    item.identifier = identifier;
    item.configurs = [[CXNetworkConfigStorage sharedInstance] configursForKey:identifier];
    return item;
}

- (CXNetworkConfigur *)currentConfigur {
    
    for (CXNetworkConfigur *configur in self.configurs) {
        if (configur.isSelected) {
            return configur;
        }
    }
    return nil;
}

- (NSString *)displayText {
    
    CXNetworkConfigur *configur = [self currentConfigur];
    if (configur.address.length > 0) {
        return configur.address;
    }
    return @"";
}
@end
