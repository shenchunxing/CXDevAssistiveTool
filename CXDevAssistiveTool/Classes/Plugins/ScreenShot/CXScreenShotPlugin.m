//
//  CXScreenShotPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXScreenShotPlugin.h"
#import "CXAssistiveManager.h"
#import "CXAssitiveWindowFactory.h"
#import "CXScreenShotPreviewViewController.h"
#import "CXScreenShotHelper.h"

@implementation CXScreenShotPlugin

- (void)pluginDidLoad {
    
    UIImage *image = [[CXScreenShotHelper sharedInstance] imageFromCurrentScreen];
    NSDictionary *data = @{@"shotImage": image};
    [self pluginDidLoad:data];
}

- (void)pluginDidLoad:(NSDictionary *)data {
    
    CXScreenShotWindow *window = [CXAssitiveWindowFactory screenShotWindow];
    CXScreenShotPreviewViewController *rootVC = (CXScreenShotPreviewViewController *)window.rootViewController;
    rootVC.shotImage = data[@"shotImage"];
    [[CXAssistiveManager sharedManager] showPluginWindow:window];
}

@end
