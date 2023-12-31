//
//  CXAssistiveMeomryLeakModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveMeomryLeakModel : NSObject

@property (nonatomic, strong) NSNumber *objectPtr;
/* 内存泄漏类 */
@property (nonatomic, copy) NSString *className;
/* 内存泄漏对象名 */
@property (nonatomic, strong) NSArray *viewStack;
/* 是否循环引用 */
@property (nonatomic, assign) BOOL isRetainCycle;
/* 循环引用 */
@property (nonatomic, strong) NSArray *retainCycle;

- (NSString *)displayText;
@end

NS_ASSUME_NONNULL_END
