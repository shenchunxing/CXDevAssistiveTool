//
//  CXDevAssistiveViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXDevAssistiveViewController.h"
#import "CXAssistiveTouch.h"
#import "CXAssistiveMacro.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "CXDevAssistiveItem.h"
#import "CXAssistiveManager.h"
#import "CXDevAssistiveFactory.h"

static NSString *rotationAnimationKey = @"TabBarButtonTransformRotationAnimationKey";

@interface CXDevAssistiveViewController ()

/* 辅助 */
@property (nonatomic, strong) CXAssistiveTouch *assisticeTouch;

@end

@implementation CXDevAssistiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.assisticeTouch];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint activePoint = [self.view convertPoint:point toView:self.assisticeTouch];
    if ([self.assisticeTouch pointInside:activePoint withEvent:event]) {
        return YES;
    }
    return NO;
}

#pragma mark - view
- (CXAssistiveTouch *)assisticeTouch {
    
    if (_assisticeTouch == nil) {
        _assisticeTouch = [[CXAssistiveTouch alloc] initWithPluginItems:[CXDevAssistiveFactory pluginItems]];
        _assisticeTouch.tapSubject = [RACSubject subject];
        [_assisticeTouch.tapSubject subscribeNext:^(id  _Nullable x) {
            [[CXAssistiveManager sharedManager] showHomeWindow];
        }];
    }
    return _assisticeTouch;
}


@end
