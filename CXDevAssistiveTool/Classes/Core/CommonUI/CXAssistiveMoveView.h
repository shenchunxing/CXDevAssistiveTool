//
//  CXAssistiveMoveView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveMoveView : UIView

@property (nonatomic, assign, getter=isOverflow) BOOL overflow;

@property (nonatomic, assign, readonly, getter=isMoved) BOOL moved;

@property (nonatomic, assign, getter=isMoveable) BOOL moveable;

- (void)viewWillUpdate:(UIPanGestureRecognizer *)sender offset:(CGPoint)offsetPoint;

- (void)viewDidUpdate:(UIPanGestureRecognizer *)sender offset:(CGPoint)offsetPoint;

@end

NS_ASSUME_NONNULL_END
