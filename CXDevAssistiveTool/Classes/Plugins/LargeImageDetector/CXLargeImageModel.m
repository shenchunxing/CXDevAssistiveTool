//
//  CXLargeImageModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXLargeImageModel.h"

@implementation CXLargeImageModel

- (BOOL)isEqual:(CXLargeImageModel *)object {
    
    if (!object) {
        return NO;
    }
    return [self.url.absoluteString isEqual:object.url.absoluteString];
}
@end
