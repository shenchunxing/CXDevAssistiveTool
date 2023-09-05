//
//  CXDevAssistiveItem.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/17.
//

#import "CXDevAssistiveItem.h"
#import "UIImage+AssistiveBundle.h"

@implementation CXDevAssistiveItem

+ (instancetype)pluginItemWithImageName:(NSString *)imageName {
    
    CXDevAssistiveItem *item = [[CXDevAssistiveItem alloc] init];
    item.pluginImage = [UIImage as_imageWithName:imageName];
    return item;
}
@end
