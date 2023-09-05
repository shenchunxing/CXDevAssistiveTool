//
//  CXNetworkConfigur.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXNetworkConfigur.h"
#import <YYModel/YYModel.h>

@implementation CXNetworkConfigur

+ (instancetype)configurWithAddress:(NSString *)address remark:(NSString *)remark {
    CXNetworkConfigur *configur = [[CXNetworkConfigur alloc] init];
    configur.address = address;
    configur.remark = remark;
    return configur;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (NSString *)description {
    return [self yy_modelDescription];
}

- (id)copy {
    return [self yy_modelCopy];
}

@end


@implementation CXNetworkConfigur (Configur)

- (BOOL)isEqual:(CXNetworkConfigur *)object {
    
    return [self.address isEqualToString:object.address];
}

- (BOOL)isValid {
    
    return self.address.length > 0;
}

- (NSString *)displayText {
    
    if (self.address.length > 0) {
        return [NSString stringWithFormat:@"%@\n%@",self.address,(self.remark?:@"")];
    }
    return self.address;
}

@end
