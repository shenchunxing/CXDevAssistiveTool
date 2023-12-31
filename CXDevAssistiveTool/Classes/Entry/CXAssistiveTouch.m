//
//  CXAssistiveTouch.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXAssistiveTouch.h"
#import "CXAssistiveMacro.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIImage+AssistiveBundle.h"
#import "CXDevAssistiveButton.h"
#import "CXDevAssistiveItem.h"

#define CXRotationAngle M_PI / 20

@interface CXAssistiveTouch ()

@property (nonatomic, strong) UIImageView *debugImgView;

@property (nonatomic, strong) NSArray<CXDevAssistiveItem *> *pluginItems;

@property (nonatomic, strong) NSArray *pluginButtons;

@property (nonatomic, assign) CGFloat transX;
@property (nonatomic, assign) CGFloat transY;

@end
@implementation CXAssistiveTouch

- (instancetype)initWithPluginItems:(NSArray<CXDevAssistiveItem *> *)pluginItems {
    
    if (self = [super init]) {
        self.pluginItems = pluginItems;
        self.frame = CGRectMake(10, CGRectGetHeight([UIScreen mainScreen].bounds)/2.0 - kAssistiveTouchW/2.0, kAssistiveTouchW, kAssistiveTouchW);
        self.layer.cornerRadius = kAssistiveTouchW/2.0;
        [self setUpDefaultUIS];
        [self addTapGesture];
        [self addLongPressGesture];
        [self addDragGesture];
        self.isLocationAtLeftSide = YES;
    }
    return self;
}

- (void)setUpDefaultUIS {
    
    UIImageView *debugImg = [[UIImageView alloc] init];
    debugImg.image = [UIImage as_imageWithName:@"icon_button_debug"];
    debugImg.frame = self.bounds;
    self.debugImgView = debugImg;
    
    [self addItems];
    
    [self addSubview:debugImg];
    
}

- (void)addItems {
    
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:self.pluginItems.count];
    
    [self.pluginItems enumerateObjectsUsingBlock:^(CXDevAssistiveItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CXDevAssistiveButton *button = [CXDevAssistiveButton pluginButtonWithSize:CGSizeMake(kAssistiveTouchW, kAssistiveTouchW) image:obj.pluginImage target:self action:@selector(tapItem:)];
        button.tag = idx;
        button.center = self.debugImgView.center;
        button.hidden = YES;
        [self addSubview:button];
        [buttons addObject:button];
    }];
    self.pluginButtons = buttons;
}

- (void)showItems {
    
    if (self.pluginItems.count == 0) {
        return;
    }
    if (!self.isShow) {
        self.isShow = YES;
        if (self.isLocationAtLeftSide) {
            [self itemShowRoundTypeWithOffsetAngle:-M_PI/2.0];
        }else {
            [self itemShowRoundTypeWithOffsetAngle:M_PI/2.0];
        }
    }else {
        [self hideItems];
    }
}

- (void)itemShowRoundTypeWithOffsetAngle:(CGFloat)offsetAngle{
    
    CGFloat count = self.pluginItems.count;
    for (CXDevAssistiveButton *button in self.pluginButtons) {
        button.hidden = NO;
        CGFloat angle = [self caculateRoundAngleWithOffsetAngle:offsetAngle index:count];
        [button itemShowWithAngle:angle];
        count --;
    }
}

- (CGFloat)caculateRoundAngleWithOffsetAngle:(CGFloat)offsetAngle index:(CGFloat)index{
    
    CGFloat angle = M_PI / (self.pluginButtons.count);
    angle = angle * index - angle / 2.0 + offsetAngle;
    return angle;
}

- (void)hideItems {
    
    for (CXDevAssistiveButton *button in self.pluginButtons) {
        [button itemHide];
        button.hidden = YES;
    }
    self.isShow = NO;
}

- (void)tapItem:(CXDevAssistiveButton *)btn {
    
    [self hideItems];
    CXDevAssistiveItem *item = self.pluginItems[btn.tag];
    if ([item.plugin respondsToSelector:@selector(pluginDidLoad)]) {
        [item.plugin pluginDidLoad];
    }
}

- (void)dealloc {
    
    [self.tapSubject sendCompleted];
    [self.longPressSubject sendCompleted];
}

#pragma mark - 重写pointInside:withEvent:方法，检查是否点击item
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isShow) {
        for (CXDevAssistiveButton *button in self.pluginButtons) {
            CGPoint buttonPoint = [self convertPoint:point toView:button];
            if ([button pointInside:buttonPoint withEvent:event]) {
                return button;
            }
        }
    }
    return [super pointInside:point withEvent:event];
}

#pragma mark - 手势事件
- (void)addTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    weak(self)
    [tapGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        strong(self)
        if (self.isShow) {
            [self hideItems];
        }
        if (self.tapSubject) {
            [self.tapSubject sendNext:x];
        }
    }];
    [self addGestureRecognizer:tapGesture];
}

- (void)addLongPressGesture {

    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] init];
    longPressGesture.minimumPressDuration = 1.0;
    weak(self)
    [longPressGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        strong(self)
        if (x.state != UIGestureRecognizerStateBegan) {
            return;
        }
        [self showItems];
    }];
    [self addGestureRecognizer:longPressGesture];
}

- (void)addDragGesture {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self addGestureRecognizer:panGesture];
}

#pragma mark - 移动
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)panGesture {

    _transX = [panGesture translationInView:self].x;
    _transY = [panGesture translationInView:self].y;
    panGesture.view.center = CGPointMake(panGesture.view.center.x + _transX, panGesture.view.center.y + _transY);
    [panGesture setTranslation:CGPointZero inView:self];
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        CGFloat self_x = self.frame.origin.x;
        CGFloat self_y = self.frame.origin.y;
        CGFloat self_w = self.frame.size.width;
        CGFloat self_H = self.frame.size.height;
        //修正坐标
        [self resetFrameX:self_x y:self_y w:self_w h:self_H];
        
        //停留在边缘
        if (self_y < touch_minY(self) + 3) {
            [self resetFrameX:self_x y:touch_minY(self) w:self_w h:self_H];
        }else {
            if (self_x < self.superview.frame.size.width/2.0) {
                [self resetFrameX:touch_minX() y:self_y w:self_w h:self_H];
            }else {
                [self resetFrameX:touch_maxX(self) y:self_y w:self_w h:self_H];
            }
        }
        if (self_y > touch_maxY(self) - 3) {
            if (self_x < self.superview.frame.size.width/2.0) {
                [self resetFrameX:self_x y:touch_maxY(self) w:self_w h:self_H];
            }else {
                [self resetFrameX:self_x y:touch_maxY(self) w:self_w h:self_H];
            }
        }
    }
}

- (void)resetFrameX:(CGFloat)x y:(CGFloat)y w:(CGFloat)width h:(CGFloat)height {
    
    if (x <= touch_minX())     x = touch_minX();
    if (x >= touch_maxX(self)) x = touch_maxX(self);
    
    if (y <= touch_minY(self)) y = touch_minY(self);
    if (y >= touch_maxY(self)) y = touch_maxY(self);
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(x, y, width, height);
    }];
    self.isLocationAtLeftSide = (x < self.superview.frame.size.width/2.0);
}

CGFloat touch_minY(CXAssistiveTouch* obj) {

    return 88.0;
}

CGFloat touch_maxY(CXAssistiveTouch* obj) {
    CGFloat bottom = 86.0;
    return (obj.superview.bounds.size.height - CGRectGetHeight(obj.frame) - bottom);
}

CGFloat touch_minX(void) {
    return 3.0;
}

CGFloat touch_maxX(CXAssistiveTouch* obj) {
    return (obj.superview.bounds.size.width - CGRectGetWidth(obj.frame) - touch_minX());
}

@end
