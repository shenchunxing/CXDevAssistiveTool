//
//  CXScreenShotStyleView.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import "CXScreenShotStyleView.h"
#import "CXScreenShotStyleModel.h"
#import "UIImage+AssistiveBundle.h"

static NSInteger kCXStyleViewTag = 1000;

@interface CXScreenShotStyleView ()


@property (nonatomic, strong) UIButton *lastSizeButton;

@property (nonatomic, strong) UIButton *lastColorButton;

@property (nonatomic, strong) CXScreenShotStyleModel *styleModel;

@end

@implementation CXScreenShotStyleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeUI];
    }
    return self;
}

- (void)initializeUI {
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    self.layer.cornerRadius = 5.0;
    self.styleModel = [[CXScreenShotStyleModel alloc] init];
    
    NSInteger count = 9;
    CGFloat marigin = 10;
    CGFloat itemWidth = 16;
    CGFloat itemHeight = 16;
    CGFloat itemMarigin = (self.frame.size.width - marigin * 2 - itemWidth * count) / (count - 1);
    CGFloat top = (self.frame.size.height - itemHeight) / 2.0;
    
    for (int i = 0; i < count; i++) {
        UIButton *button = [self buttonWithFrame:CGRectMake(marigin + i * (itemWidth + itemMarigin), top, itemWidth, itemHeight)];
        NSString *imageName = @"";
        NSString *selectImageName = @"";
        switch (i) {
            case CXScreenShotStyleSmall:{
                imageName = @"icon_dot_small";
                selectImageName = @"icon_dot_small_select";
                button.selected = YES;
                self.lastSizeButton = button;
            }
                break;
            case CXScreenShotStyleMedium:{
                imageName = @"icon_dot_medium";
                selectImageName = @"icon_dot_medium_select";
            }
                break;
            case CXScreenShotStyleBig:{
                imageName = @"icon_dot_big";
                selectImageName = @"icon_dot_big_select";
            }
                break;
            case CXScreenShotStyleRed:{
                imageName = @"icon_color_red";
                selectImageName = @"icon_color_red";
                button.selected = YES;
                button.layer.borderWidth = 2;
                self.lastColorButton = button;
            }
                break;
            case CXScreenShotStyleBlue:{
                imageName = @"icon_color_blue";
                selectImageName = @"icon_color_blue";
            }
                break;
            case CXScreenShotStyleGreen:{
                imageName = @"icon_color_green";
                selectImageName = @"icon_color_green";
            }
                break;
            case CXScreenShotStyleYellow:{
                imageName = @"icon_color_yellow";
                selectImageName = @"icon_color_yellow";
            }
                break;
            case CXScreenShotStyleGray:{
                imageName = @"icon_color_gray";
                selectImageName = @"icon_color_gray";
            }
                break;
            case CXScreenShotStyleWhite:{
                imageName = @"icon_color_white";
                selectImageName = @"icon_color_white";
            }
                break;
            default:
                break;
        }
        [button setImage:[UIImage as_imageWithName:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage as_imageWithName:selectImageName] forState:UIControlStateSelected];
        button.tag = kCXStyleViewTag+i;
        button.showsTouchWhenHighlighted = NO;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
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
    
    if (button.tag-kCXStyleViewTag <= CXScreenShotStyleBig) {
        // Size button
        if (self.lastSizeButton != button) {
            self.lastSizeButton.selected = NO;
            button.selected = YES;
            self.lastSizeButton = button;
            self.styleModel.size = button.tag-kCXStyleViewTag;
        }
    } else {
        // Color button
        if (self.lastColorButton != button) {
            self.lastColorButton.selected = NO;
            self.lastColorButton.layer.borderWidth = 0;
            button.selected = YES;
            button.layer.borderWidth = 2;
            self.lastColorButton = button;
            self.styleModel.color = button.tag-kCXStyleViewTag;
        }
    }
}

- (CXScreenShotStyleModel *)currentStyleModel {
    
    return self.styleModel;
}

- (void)resetStyleView {
    
    UIButton *sizeButton = [self viewWithTag:kCXStyleViewTag+CXScreenShotStyleSmall];
    [self onButtonClick:sizeButton];
    
    UIButton *colorButton = [self viewWithTag:kCXStyleViewTag+CXScreenShotStyleRed];
    [self onButtonClick:colorButton];
}


@end
