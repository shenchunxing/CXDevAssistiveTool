//
//  CXScreenShotStyleModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import "CXScreenShotDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXScreenShotStyleModel : NSObject

/* <#备注#> */
@property (nonatomic, assign) CXScreenShotStyle size;
@property (nonatomic, assign) CXScreenShotStyle color;

- (instancetype)initWithSize:(CXScreenShotStyle)size color:(CXScreenShotStyle)color;
@end

NS_ASSUME_NONNULL_END
