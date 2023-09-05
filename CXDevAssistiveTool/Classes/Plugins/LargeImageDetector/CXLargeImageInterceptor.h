//
//  CXLargeImageInterceptor.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import <Foundation/Foundation.h>
#import "CXLargeImageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXLargeImageInterceptor : NSObject

/* 检测到的图片 */
@property (nonatomic, strong) NSMutableArray *images;
/* 最小检测大小,默认200KB */
@property (nonatomic, assign) NSInteger minimumSize;
@property (nonatomic, assign) BOOL canIntercept;

+ (instancetype)shareInterceptor;

- (void)addImageModel:(CXLargeImageModel *)imageModel;
- (void)removeAllImages;
@end

NS_ASSUME_NONNULL_END
