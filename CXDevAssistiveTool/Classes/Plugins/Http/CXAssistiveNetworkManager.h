//
//  CXAssistiveNetworkManager.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import <Foundation/Foundation.h>
#import "CXAssistiveHttpModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveNetworkManager : NSObject

@property (nonatomic, assign) BOOL canIntercept;
/* 数据模型组 */
@property (nonatomic, strong, readonly) NSMutableArray<CXAssistiveHttpModel *> *httpModels;

+ (instancetype)shareManager;

- (void)clearAll;

@end

NS_ASSUME_NONNULL_END
