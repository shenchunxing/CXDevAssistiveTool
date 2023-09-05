//
//  CXScreenShotStyleModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import "CXScreenShotStyleModel.h"

@implementation CXScreenShotStyleModel

- (instancetype)init {
    
    if (self = [super init]) {
        _size = CXScreenShotStyleSmall;
        _color = CXScreenShotStyleRed;
    }
    return self;
}

- (instancetype)initWithSize:(CXScreenShotStyle)size color:(CXScreenShotStyle)color {
    
    if (self = [super init]) {
        
        if (size >= CXScreenShotStyleSmall && size <= CXScreenShotStyleBig) {
            _size = size;
        }
        if (color >= CXScreenShotStyleRed && color <= CXScreenShotStyleWhite) {
            _color = color;
        }
    }
    return self;
}

@end
