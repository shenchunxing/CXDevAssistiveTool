//
//  CXDevAssistiveItem.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import "CXDevAssistiveProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXDevAssistiveItem : NSObject

/* 图标 */
@property (nonatomic, strong) UIImage *pluginImage;
/* 点击信号 */
@property (nonatomic, strong) id<CXDevAssistiveProtocol> plugin;

+ (instancetype)pluginItemWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
