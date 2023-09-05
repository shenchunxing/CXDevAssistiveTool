//
//  CXNetworkEnvironmentEditViewController.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import <UIKit/UIKit.h>
#import "CXAssistiveBaseViewController.h"
@class CXNetworkConfigur;
@interface CXNetworkEnvironmentEditViewController : CXAssistiveBaseViewController

@property (nonatomic, copy) void(^selectHandler)(NSMutableArray<CXNetworkConfigur *> *configs);

- (instancetype)initWithIdentifier:(NSString *)identifier configurs:(NSArray<CXNetworkConfigur *> *)configurs;
@end

