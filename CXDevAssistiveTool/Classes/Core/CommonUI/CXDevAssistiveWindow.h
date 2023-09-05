//
//  CXDevAssistiveWindow.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXAssistiveBaseWindow.h"
#import "CXAssistiveNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CXDevAssistiveWindowDelegate <NSObject>

- (void)pluginWindowDidClosed;

@end

@interface CXDevAssistiveWindow : CXAssistiveBaseWindow<CXDevAssistiveWindowDelegate>

- (CXAssistiveNavigationController *)navigationController:(UIViewController *)vc;
- (CXAssistiveNavigationController *)navigationControllerByClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
