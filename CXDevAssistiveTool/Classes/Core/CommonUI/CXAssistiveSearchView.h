//
//  CXAssistiveSearchView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^AssistiveSearchBlock)(NSString *text);

@interface CXAssistiveSearchView : UIView

@property (nonatomic, copy) AssistiveSearchBlock searchBlock;

@end

NS_ASSUME_NONNULL_END
