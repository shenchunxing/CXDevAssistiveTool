//
//  CXSandBoxModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CXSandBoxFileType) {
    CXSandBoxFileTypeDirectory,     //文件夹
    CXSandBoxFileTypeFile           //文件
};

@interface CXSandBoxModel : NSObject

/* 文件名 */
@property (nonatomic, copy) NSString *name;
/* 路径 */
@property (nonatomic, copy) NSString *path;
/* 文件类型 */
@property (nonatomic, assign) CXSandBoxFileType fileType;

@end

NS_ASSUME_NONNULL_END
