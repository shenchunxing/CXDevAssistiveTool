//
//  CXAssistiveSearchView.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXAssistiveSearchView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIColor+AssistiveColor.h"
#import "UIView+AssistiveUtils.h"
#import "UIImage+AssistiveBundle.h"
#import "CXAssistiveDefine.h"

@interface CXAssistiveSearchView ()

@property (nonatomic, strong) UITextField *textfield;

@end

@implementation CXAssistiveSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor as_mainColor];
        
        self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(20, 6, self.as_width-40, 32)];
        self.textfield.font = [UIFont systemFontOfSize:13.0];
        self.textfield.textColor = [UIColor as_bodyColor];
        self.textfield.placeholder = @"请输入关键字搜索";
        self.textfield.backgroundColor = [UIColor whiteColor];
        self.textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textfield.layer.cornerRadius = 2.0;
        
        UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 16, 16)];
        iconImg.image = [UIImage as_imageWithName:@"icon_search_as"];
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36, 32)];
        [leftView addSubview:iconImg];
        
        self.textfield.leftView = leftView;
        self.textfield.leftViewMode = UITextFieldViewModeAlways;
        
        [self addSubview:self.textfield];
        weak(self);
        [self.textfield.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            strong(self);
            if (self.searchBlock) {
                self.searchBlock(x);
            }
        }];
    }
    return self;
}

@end
