//
//  CXScreenShotAction.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import "CXScreenShotOperation.h"

@interface CXScreenShotOperation ()

@property (nonatomic, strong) CXScreenShotStyleModel *style;

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation CXScreenShotOperation

- (instancetype)init {
    
    if (self = [super init]) {
        self.style = [[CXScreenShotStyleModel alloc] initWithSize:CXScreenShotStyleSmall color:CXScreenShotStyleRed];
        self.action = CXScreenShotActionRect;
        self.path = [UIBezierPath bezierPath];
        self.shapeLayer = [CAShapeLayer layer];
    }
    return self;
}

- (instancetype)initWithStyle:(CXScreenShotStyleModel *)styleModel action:(CXScreenShotAction)action {
    
    if (self = [super init]) {
        self.style = styleModel;
        self.action = action;
        self.path = [UIBezierPath bezierPath];
        self.shapeLayer = [CAShapeLayer layer];
    }
    return self;
}

- (void)drawImageView:(CGRect)rect {
    
    
}

- (CGRect)rectWithPoint:(CGPoint)point otherPoint:(CGPoint)otherPoint {
    
    CGFloat x = MIN(point.x, otherPoint.x);
    CGFloat y = MIN(point.y, otherPoint.y);
    CGFloat maxX = MAX(point.x, otherPoint.x);
    CGFloat maxY = MAX(point.y, otherPoint.y);
    CGFloat width = maxX - x;
    CGFloat height = maxY - y;
    // Return rect nearby
    CGFloat gap = 1 / 2.0;
    if (width == 0) {
        width = gap;
    }
    if (height == 0) {
        height = gap;
    }
    return CGRectMake(x, y, width, height);
}

- (CXScreenShotStyle)size {
    return self.style.size;
}

- (CXScreenShotStyle)color {
    return self.style.color;
}

#pragma mark - Primary
- (CGRect)rectWithPoint:(CGPoint)point {
    CGFloat size = [self sizeByStyle] / 2.0;
    return CGRectMake(point.x - size, point.y - size, size, size);
}

- (CGFloat)sizeByStyle {
    switch (self.size) {
        case CXScreenShotStyleSmall:
            return 3;
        case CXScreenShotStyleMedium:
            return 6;
        case CXScreenShotStyleBig:
            return 9;
        default:
            break;
    }
    return 3;
}

- (UIColor *)colorByStyle {
    switch (self.color) {
        case CXScreenShotStyleRed:
            return [UIColor colorWithRed:0xff/255.0 green:0x3b/255.0 blue:0x30/255.0 alpha:1];
        case CXScreenShotStyleBlue:
            return [UIColor colorWithRed:0x10/255.0 green:0x8e/255.0 blue:0xff/255.0 alpha:1];
        case CXScreenShotStyleGreen:
            return [UIColor colorWithRed:0x59/255.0 green:0xb5/255.0 blue:0x0a/255.0 alpha:1];
        case CXScreenShotStyleYellow:
            return [UIColor colorWithRed:0xf4/255.0 green:0xa5/255.0 blue:0x00/255.0 alpha:1];
        case CXScreenShotStyleGray:
            return [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1];
        case CXScreenShotStyleWhite:
            return [UIColor whiteColor];
        default:
            break;
    }
    return [UIColor whiteColor];
}

- (UIFont *)fontByStyle {
    switch (self.size) {
        case CXScreenShotStyleSmall:
            return [UIFont systemFontOfSize:12];
        case CXScreenShotStyleMedium:
            return [UIFont systemFontOfSize:14];
        case CXScreenShotStyleBig:
            return [UIFont systemFontOfSize:17];
        default:
            break;
    }
    return [UIFont systemFontOfSize:12];
}


@end


@implementation CXScreenShotDoubleOperation

@end

@implementation CXScreenShotRectOperation

- (void)drawImageView:(CGRect)rect {
    
    CGRect rectPath = CGRectZero;
    if (self.startValue && self.endValue) {
        rectPath = [self rectWithPoint:self.startValue.CGPointValue otherPoint:self.endValue.CGPointValue];
    }
    [self configPathWithRect:rectPath];
}

- (void)configPathWithRect:(CGRect)rect {
    self.path = [UIBezierPath bezierPathWithRect:rect];
    self.shapeLayer.lineWidth = [self sizeByStyle];
    self.shapeLayer.strokeColor = [self colorByStyle].CGColor;
    self.shapeLayer.fillColor = nil;
    self.shapeLayer.path = self.path.CGPath;
}

@end

@implementation CXScreenShotRoundOperation

- (void)drawImageView:(CGRect)rect {
    
    CGRect rectPath = CGRectZero;
    if (self.startValue && self.endValue) {
        rectPath = [self rectWithPoint:self.startValue.CGPointValue otherPoint:self.endValue.CGPointValue];
    }
    [self configPathWithRect:rectPath];
}

- (void)configPathWithRect:(CGRect)rect {
    self.path = [UIBezierPath bezierPathWithOvalInRect:rect];
    self.shapeLayer.lineWidth = [self sizeByStyle];
    self.shapeLayer.strokeColor = [self colorByStyle].CGColor;
    self.shapeLayer.fillColor = nil;
    self.shapeLayer.path = self.path.CGPath;
}

@end

@implementation CXScreenShotLineOperation

- (void)drawImageView:(CGRect)rect {
    
    if (self.startValue && self.endValue) {
        self.path = [UIBezierPath bezierPath];
        [self.path moveToPoint:self.startValue.CGPointValue];
        [self.path addLineToPoint:self.endValue.CGPointValue];
        self.shapeLayer.lineWidth = [self sizeByStyle];
        self.shapeLayer.strokeColor = [self colorByStyle].CGColor;
        self.shapeLayer.fillColor = nil;
        self.shapeLayer.path = self.path.CGPath;
    }
}

@end


@interface CXScreenShotDrawOperation ()

@property (nonatomic, strong) NSMutableArray <NSValue *>*values;
@end

@implementation CXScreenShotDrawOperation

- (instancetype)initWithStyle:(CXScreenShotStyleModel *)styleModel action:(CXScreenShotAction)action {
    
    if (self = [super initWithStyle:styleModel action:action]) {
        self.values = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addValue:(NSValue *)value {
    
    [self.values addObject:value];
    if (self.values.count == 1) {
        [self.path moveToPoint:value.CGPointValue];
    }else {
        [self.path addLineToPoint:value.CGPointValue];
    }
}

- (void)drawImageView:(CGRect)rect {
    
    self.shapeLayer.lineWidth = [self sizeByStyle];
    self.shapeLayer.strokeColor = [self colorByStyle].CGColor;
    self.shapeLayer.fillColor = nil;
    self.shapeLayer.path = self.path.CGPath;
}
@end


@implementation CXScreenShotTextOperation

- (instancetype)initWithStyle:(CXScreenShotStyleModel *)styleModel action:(CXScreenShotAction)action {
    
    if (self = [super initWithStyle:styleModel action:action]) {
        self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
        self.textView.delegate = self;
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.showsHorizontalScrollIndicator = NO;
        self.textView.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.textColor = [self colorByStyle];
    textView.font = [self fontByStyle];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length == 0) {
        [textView removeFromSuperview];
    } else {
        textView.editable = NO;
        textView.selectable = NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    CGSize size = [textView sizeThatFits:CGSizeMake(textView.frame.size.width, MAXFLOAT)];
    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, textView.frame.size.width, size.height);
}


@end
