//
//  UIImageView+AssistiveSDWebImage.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "UIImageView+AssistiveSDWebImage.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <objc/runtime.h>
#import "CXAssistiveDefine.h"
#import "CXLargeImageInterceptor.h"
#import "UIColor+AssistiveColor.h"
#import "CXAssistiveUtil.h"

@implementation UIImageView (AssistiveSDWebImage)

#if DEBUG
+ (void)load {
 
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    Method originAddObserverMethod = class_getInstanceMethod(self, @selector(sd_setImageWithURL:placeholderImage:options:progress:completed:));
    if (originAddObserverMethod) {
        CXSwizzleInstanceMethod(self, @selector(sd_setImageWithURL:placeholderImage:options:progress:completed:), @selector(assistive_sd_setImageWithURL:placeholderImage:options:progress:completed:));
    }
#pragma clang diagnostic pop
    
}
#endif

- (void)assistive_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NSUInteger)options progress:(id)progressBlock completed:(void(^)(UIImage *image, NSError *error, NSInteger cacheType, NSURL *imageURL))completedBlock{

    if ([CXLargeImageInterceptor shareInterceptor].canIntercept) {
        
        __weak typeof(self) weafSelf = self;
        id replaceBlock = ^(UIImage *image, NSError *error, NSInteger cacheType, NSURL *imageURL){
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSData *data = [[SDImageCache sharedImageCache] diskImageDataForKey:[[SDWebImageManager sharedManager] cacheKeyForURL:imageURL]];
                NSString *size = [CXAssistiveUtil formatByte:data.length];
                UIImage *newImage = nil;
                if (data.length > [CXLargeImageInterceptor shareInterceptor].minimumSize) {
                    NSString *drawText = [NSString stringWithFormat:@"url : %@ \n size : %@",[url absoluteString],size];
                    newImage = [weafSelf drawText:drawText inImage:image];
                    CXLargeImageModel *imageModel = [[CXLargeImageModel alloc] init];
                    imageModel.url = imageURL;
                    imageModel.imageData = data;
                    imageModel.size = size;
                    [[CXLargeImageInterceptor shareInterceptor] addImageModel:imageModel];
                }else {
                    newImage = image;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    weafSelf.image = newImage;
                    if (completedBlock) {
                        completedBlock(newImage, error, cacheType,imageURL);
                    }
                });
            });
        };
       
        [self assistive_sd_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:replaceBlock];
    }else {
        [self assistive_sd_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:completedBlock];
    }
}

- (UIImage *)drawText:(NSString *)text inImage:(UIImage *)image{
    UIFont *font = [UIFont boldSystemFontOfSize:12 * (image.size.height / 230)];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    [text drawInRect:CGRectIntegral(rect) withAttributes:@{
                                                           NSFontAttributeName : font,
                                                           NSForegroundColorAttributeName : [UIColor as_mainColor]
                                                           }];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
