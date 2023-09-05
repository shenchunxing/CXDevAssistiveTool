//
//  CXDevAssistiveFactory.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import <Foundation/Foundation.h>
#import "CXAssistiveFunctionModel.h"
#import "CXDevAssistiveItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXDevAssistiveFactory : NSObject

+ (NSMutableArray<CXAssistiveFunctionViewModel *> *)homeFunctions;

+ (NSArray<CXDevAssistiveItem *> *)pluginItems;

@end

NS_ASSUME_NONNULL_END
