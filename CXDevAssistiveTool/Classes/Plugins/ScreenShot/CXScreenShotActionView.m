//
//  CXScreenShotActionView.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import "CXScreenShotActionView.h"
#import "UIImage+AssistiveBundle.h"

@interface CXScreenShotActionView ()

@property (nonatomic, strong) UIButton *lastSelectedButton;

@end

@implementation CXScreenShotActionView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeUI];
    }
    return self;
}

- (void)initializeUI {
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.layer.cornerRadius = 5.0;
    
    NSInteger count = 8;
    CGFloat margin = 10.0;
    CGFloat itemWidth = (CGRectGetWidth(self.frame) - margin * 2) / count;
    CGFloat itemHeight = CGRectGetHeight(self.frame);
    
    for (NSInteger i =1; i <= count; i++) {
        UIButton *button = [self buttonWithFrame:CGRectMake(margin+(i-1)*itemWidth, 0, itemWidth, itemHeight)];
        
        NSString *imageName = nil;
        NSString *selectedImageName = nil;
        switch (i) {
            case CXScreenShotActionRect:
                imageName = @"icon_rectangle";
                selectedImageName = @"icon_rectangle_select";
                break;
            case CXScreenShotActionRound:
                imageName = @"icon_oval";
                selectedImageName = @"icon_oval_select";
                break;
            case CXScreenShotActionLine:
                imageName = @"icon_line";
                selectedImageName = @"icon_line_select";
                break;
            case CXScreenShotActionDraw:
                imageName = @"icon_draw";
                selectedImageName = @"icon_draw_select";
                break;
            case CXScreenShotActionText:
                imageName = @"icon_text";
                selectedImageName = @"icon_text_selected";
                break;
            case CXScreenShotActionRevoke:
                imageName = @"icon_revoke";
                selectedImageName = @"icon_revoke";
                break;
            case CXScreenShotActionCancel:
                imageName = @"icon_cancel";
                selectedImageName = @"icon_cancel";
                break;
            case CXScreenShotActionConfirm:
                imageName = @"icon_confirm";
                selectedImageName = @"icon_confirm";
                break;
            default:
                break;
        }
        [button setImage:[UIImage as_imageWithName:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage as_imageWithName:selectedImageName] forState:UIControlStateSelected];
        button.tag = i;
        button.showsTouchWhenHighlighted = NO;
    }
    
}

- (UIButton *)buttonWithFrame:(CGRect)frame {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    button.frame = frame;
    return button;
}

- (void)onButtonClick:(UIButton *)button {
    
    switch (button.tag) {
        case CXScreenShotActionRect:
        case CXScreenShotActionRound:
        case CXScreenShotActionLine:
        case CXScreenShotActionDraw:
        case CXScreenShotActionText:
        {
            if (self.lastSelectedButton != button) {
                self.lastSelectedButton.selected = NO;
                button.selected = YES;
                self.lastSelectedButton = button;
            }else {
                button.selected = NO;
                self.lastSelectedButton = nil;
            }
        }
            break;

        default:
            break;
    }
    if ([self.actionDelegate respondsToSelector:@selector(screenShotActionView:didSelectedAction:isSelected:atPosition:)]) {
        CGFloat position = button.frame.origin.x + button.frame.size.width / 2.0;
        [self.actionDelegate screenShotActionView:self didSelectedAction:button.tag isSelected:button.isSelected atPosition:position];
    }
}
@end
