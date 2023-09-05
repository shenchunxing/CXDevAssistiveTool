//
//  CXAssistiveFunctionModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import <Foundation/Foundation.h>
#import "CXDevAssistiveProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveFunctionModel : NSObject

/* 图标 */
@property (nonatomic, copy) NSString *imageName;
/* 名 */
@property (nonatomic, copy) NSString *name;
/* 描述 */
@property (nonatomic, copy) NSString *des;

@property (nonatomic, strong) id<CXDevAssistiveProtocol> plugin;

+ (instancetype)functionModelWithName:(NSString *)name imageName:(NSString *)imageName des:(NSString *)des;

@end


@interface CXAssistiveFunctionViewModel : NSObject

/* 标题 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<CXAssistiveFunctionModel *> *functionModels;

+ (instancetype)viewModelWithTitle:(NSString *)title models:(NSArray<CXAssistiveFunctionModel *> *)models;

@end

NS_ASSUME_NONNULL_END
