//
//  CXAssistiveFunctionModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import "CXAssistiveFunctionModel.h"

@implementation CXAssistiveFunctionModel

+ (instancetype)functionModelWithName:(NSString *)name imageName:(NSString *)imageName des:(NSString *)des {
    
    CXAssistiveFunctionModel *model = [[CXAssistiveFunctionModel alloc] init];
    model.name = name;
    model.imageName = imageName;
    model.des = des;
    return model;
}

@end

@implementation CXAssistiveFunctionViewModel

+ (instancetype)viewModelWithTitle:(NSString *)title models:(NSArray<CXAssistiveFunctionModel *> *)models {
    
    CXAssistiveFunctionViewModel *model = [[CXAssistiveFunctionViewModel alloc] init];
    model.title = title;
    model.functionModels = models;
    return model;
    
}

@end
