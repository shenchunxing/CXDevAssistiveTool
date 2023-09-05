//
//  CXAssistiveBaseViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/10.
//

#import "CXAssistiveBaseViewController.h"
#import "UIColor+AssistiveColor.h"

@interface CXAssistiveBaseViewController ()

@end

@implementation CXAssistiveBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor as_backgroudColor];
    [self as_setupNavigationBar];
}
@end
