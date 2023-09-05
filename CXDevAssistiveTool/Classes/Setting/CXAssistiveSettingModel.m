//
//  CXAssistiveSettingModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/19.
//

#import "CXAssistiveSettingModel.h"
#import <YYModel/YYModel.h>
@implementation CXAssistiveSettingModel

+ (instancetype)settingModelWithTitle:(NSString *)title detail:(NSString *)detail {

    CXAssistiveSettingModel *settingModel = [[CXAssistiveSettingModel alloc] init];
    settingModel.title = title;
    settingModel.detail = detail;
    settingModel.isOn = NO;
    settingModel.switchSignal = [RACSubject subject];
    return settingModel;
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
