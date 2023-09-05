//
//  CXScreenShotImageView.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/11.
//

#import "CXScreenShotImageView.h"

@interface CXScreenShotImageView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray<CXScreenShotOperation *> *operations;

@end
@implementation CXScreenShotImageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeUI];
    }
    return self;
}

- (void)initializeUI {
    
    self.operations = [[NSMutableArray alloc] init];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.userInteractionEnabled = NO;
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.imageView];
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 2;
    self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeZero;
    self.imageView.layer.shadowOpacity = 0.5;
}

- (void)setShotImage:(UIImage *)shotImage {
    
    if (_shotImage != shotImage) {
        _shotImage = shotImage;
        self.imageView.image = shotImage;
    }
}

- (void)setCurrentAction:(CXScreenShotAction)currentAction {
    
    if (_currentAction != currentAction) {
        _currentAction = currentAction;
        if (currentAction> CXScreenShotActionNone && currentAction < CXScreenShotActionRevoke) {
            self.userInteractionEnabled = YES;
        }else {
            self.userInteractionEnabled = NO;
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([self.currentOperation isKindOfClass:[CXScreenShotTextOperation class]]) {
        
        CXScreenShotTextOperation *textOperation = (CXScreenShotTextOperation *)self.currentOperation;
        [textOperation.textView resignFirstResponder];
        if (self.currentAction == CXScreenShotActionText) {
            self.currentOperation = nil;
            return;
        }
    }
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, point)) {
        return;
    }
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    switch (self.currentAction) {
        case CXScreenShotActionRect:{
            
            CXScreenShotRectOperation *operation = [[CXScreenShotRectOperation alloc] initWithStyle:self.styleModel action:CXScreenShotActionRect];
            self.currentOperation = operation;
            [self.operations addObject:operation];
            [self.layer addSublayer:operation.shapeLayer];
            operation.startValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionRound:{
            
            CXScreenShotRoundOperation *operation = [[CXScreenShotRoundOperation alloc] initWithStyle:self.styleModel action:CXScreenShotActionRound];
            self.currentOperation = operation;
            [self.operations addObject:operation];
            [self.layer addSublayer:operation.shapeLayer];
            operation.startValue = pointValue;
            [self setNeedsDisplay];
        }
            
            break;
        case CXScreenShotActionLine:{
            
            CXScreenShotLineOperation *operation = [[CXScreenShotLineOperation alloc] initWithStyle:self.styleModel action:CXScreenShotActionLine];
            self.currentOperation = operation;
            [self.operations addObject:operation];
            [self.layer addSublayer:operation.shapeLayer];
            operation.startValue = pointValue;
            [self setNeedsDisplay];
        }
            
            break;
        case CXScreenShotActionDraw:{
            
            CXScreenShotDrawOperation *operation = [[CXScreenShotDrawOperation alloc] initWithStyle:self.styleModel action:CXScreenShotActionDraw];
            self.currentOperation = operation;
            [self.operations addObject:operation];
            [self.layer addSublayer:operation.shapeLayer];
            [operation addValue:pointValue];
            [self setNeedsDisplay];
        }
            
            break;
        case CXScreenShotActionText:{
            
            if (self.frame.size.height - 30 < point.y) {
                return;
            }
            CXScreenShotTextOperation *operation = [[CXScreenShotTextOperation alloc] initWithStyle:self.styleModel action:CXScreenShotActionText];
            self.currentOperation = operation;
            [self.operations addObject:operation];
            [self addSubview:operation.textView];
            operation.textView.frame = CGRectMake(point.x, point.y, CGRectGetWidth(self.frame)-10-point.x, 30);
            [operation.textView becomeFirstResponder];
        }
            break;
        default:
            break;
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, point)) {
        return;
    }
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    switch (self.currentAction) {
        case CXScreenShotActionRect:{
            CXScreenShotRectOperation *operation = (CXScreenShotRectOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionRound:{
            CXScreenShotRoundOperation *operation = (CXScreenShotRoundOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionLine:{
            CXScreenShotLineOperation *operation = (CXScreenShotLineOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionDraw:{
            CXScreenShotDrawOperation *operation = (CXScreenShotDrawOperation *)self.currentOperation;
            [operation addValue:pointValue];
            [self setNeedsDisplay];
        }
            break;
        default:
            break;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, point)) {
        return;
    }
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    switch (self.currentAction) {
        case CXScreenShotActionRect:{
            CXScreenShotRectOperation *operation = (CXScreenShotRectOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionRound:{
            CXScreenShotRoundOperation *operation = (CXScreenShotRoundOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionLine:{
            CXScreenShotLineOperation *operation = (CXScreenShotLineOperation *)self.currentOperation;
            operation.endValue = pointValue;
            [self setNeedsDisplay];
        }
            break;
        case CXScreenShotActionDraw:{
            CXScreenShotDrawOperation *operation = (CXScreenShotDrawOperation *)self.currentOperation;
            [operation addValue:pointValue];
            [self setNeedsDisplay];
        }
            break;
        default:
            break;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    [self.currentOperation drawImageView:rect];
}

- (void)removeLastOperation {
    
    CXScreenShotOperation *operation = self.operations.lastObject;
    switch (operation.action) {
        case CXScreenShotActionRect:
        case CXScreenShotActionRound:
        case CXScreenShotActionLine:
        case CXScreenShotActionDraw:
        {
            [operation.shapeLayer removeFromSuperlayer];
            [self.operations removeObject:operation];
        }
            break;
        case CXScreenShotActionText:
        {
            CXScreenShotTextOperation *txtOp = (CXScreenShotTextOperation *)operation;
            [txtOp.textView removeFromSuperview];
            [self.operations removeObject:txtOp];
        }
            break;
        default:
            break;
    }
}

@end
