//
//  CXViewFrameManager.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXViewFrameManager : NSObject

+ (instancetype)defaultManager;

@property (nonatomic, assign) BOOL enable;


@end

NS_ASSUME_NONNULL_END
