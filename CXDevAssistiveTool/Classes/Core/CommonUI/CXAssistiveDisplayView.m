//
//  CXAssistiveDisplayView.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXAssistiveDisplayView.h"
#import "UIFont+AssistiveFont.h"
#import "UIColor+AssistiveColor.h"
#import "UIView+AssistiveUtils.h"
#import "CXAssistiveDefine.h"

@interface CXAssistiveDisplayView ()

@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation CXAssistiveDisplayView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.layer.borderColor = [UIColor as_mainColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 4.0;
        self.backgroundColor = [UIColor as_backgroudColor];
        
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeButton.frame = CGRectMake(self.as_width - 40 - 10, 10, 40, 20);
        self.closeButton.titleLabel.font = [UIFont as_13];
        [self.closeButton setTitle:@"关 闭" forState:UIControlStateNormal];
        [self.closeButton setTitleColor:[UIColor as_mainColor] forState:UIControlStateNormal];
        [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.closeButton.layer.cornerRadius = 2.0;
        self.closeButton.layer.borderWidth = 1.0;
        self.closeButton.layer.borderColor = [UIColor as_mainColor].CGColor;
        [self addSubview:self.closeButton];
    }
    return self;
}

- (void)closeButtonClicked:(UIButton *)sender {
 
    [self viewDidClose];
}

- (void)viewDidClose {

    CXMethodNotImplemented();
}

@end
