//
//  CXScreenShotToolBar.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import "CXScreenShotToolBar.h"
#import "CXScreenShotStyleView.h"
#import "CXScreenShotActionView.h"
#import "UIImage+AssistiveBundle.h"

@interface CXScreenShotToolBar ()<CXScreenShotActionViewDelegate>

@property (nonatomic, strong) CXScreenShotActionView *actionView;

@property (nonatomic, strong) CXScreenShotStyleView *styleView;

@property (nonatomic, strong) UIView *styleBackgroundView;

@property (nonatomic, strong) UIImageView *triangleView;

@property (nonatomic, assign) BOOL styleViewShowed;

@end

@implementation CXScreenShotToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeUI];
    }
    return self;
}

- (void)initializeUI {
    
    CGFloat itemHeight = (self.frame.size.height - 10) /2.0;
    
    self.actionView = [[CXScreenShotActionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), itemHeight)];
    self.actionView.actionDelegate = self;
    [self addSubview:self.actionView];
    
    self.styleBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, itemHeight, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-itemHeight)];
    [self addSubview:self.styleBackgroundView];
    
    CGFloat triangleHeight = 12.0;
    self.triangleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, triangleHeight * 2, triangleHeight)];
    self.triangleView.image = [UIImage as_imageWithName:@"icon_arrow"];
    [self.styleBackgroundView addSubview:self.triangleView];
    
    self.styleView = [[CXScreenShotStyleView alloc] initWithFrame:CGRectMake(0, triangleHeight, CGRectGetWidth(self.styleBackgroundView.frame), CGRectGetHeight(self.styleBackgroundView.frame) - triangleHeight)];
    [self.styleBackgroundView addSubview:self.styleView];
    self.styleBackgroundView.hidden = YES;
}


- (void)showStyleViewAtIndex:(NSInteger)index atPosition:(CGFloat)position {
    
    self.styleBackgroundView.hidden = NO;
    [self.styleView resetStyleView];
    [UIView animateWithDuration:0.25 animations:^{
        CGRect oriFrame = self.triangleView.frame;
        CGFloat actionViewBottom = self.actionView.frame.size.height + self.actionView.frame.origin.y;
        self.triangleView.frame = CGRectMake(position - oriFrame.size.width / 2.0, oriFrame.origin.y, oriFrame.size.width, oriFrame.size.height);
        self.styleBackgroundView.frame = CGRectMake(0, actionViewBottom, self.styleBackgroundView.frame.size.width, self.styleBackgroundView.frame.size.height);
    } completion:^(BOOL finished) {
        self.styleViewShowed = YES;
    }];
}

- (void)hideStyleView {
    
    if (self.styleViewShowed) {
        CGRect orFrame = self.styleBackgroundView.frame;
        [UIView animateWithDuration:0.25 animations:^{
            self.styleBackgroundView.frame = CGRectMake(orFrame.origin.x, CGRectGetHeight(self.frame), CGRectGetWidth(orFrame), CGRectGetHeight(orFrame));
        } completion:^(BOOL finished) {
            self.styleViewShowed = NO;
            self.styleBackgroundView.hidden = YES;
        }];
    }
}

- (void)screenShotActionView:(CXScreenShotActionView *)view didSelectedAction:(CXScreenShotAction)action isSelected:(BOOL)isSelected atPosition:(CGFloat)position {
    
    switch (action) {
        case CXScreenShotActionRect:
        case CXScreenShotActionRound:
        case CXScreenShotActionLine:
        case CXScreenShotActionDraw:
        case CXScreenShotActionText:{

            if (isSelected) {
                [self showStyleViewAtIndex:action atPosition:position];
            }else {
                [self hideStyleView];
            }
        }
            break;
        case CXScreenShotActionRevoke:{
            
        }
            break;
        case CXScreenShotActionCancel:{
            
        }
            break;
        case CXScreenShotActionConfirm:{
            
        }
            break;
        default:
            break;
    }
    
    if ([self.delegate respondsToSelector:@selector(screenShotToolBar:didSeletAction:styleModel:)]) {
        CXScreenShotStyleModel *model = nil;
        if (action < CXScreenShotActionRevoke) {
            if (isSelected) {
                model = [self.styleView currentStyleModel];
            } else {
                action = CXScreenShotActionNone;
            }
        }
        [self.delegate screenShotToolBar:self didSeletAction:action styleModel:model];
    }
}

@end
