//
//  CXAssistiveHttpModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/27.
//

#import <Foundation/Foundation.h>


@interface CXAssistiveHttpModel : NSObject

/* 记录唯一标识 */
@property (nonatomic, copy) NSString *httpIndentifier;
/* url地址 */
@property (nonatomic,copy) NSURL *url;
/* 请求方式 */
@property (nonatomic,copy) NSString *method;
/* 头部 */
@property (nonatomic, strong) NSDictionary *headerFields;
/* 请求体 */
@property (nonatomic,copy) NSString *requestBody;
/* 状态码 */
@property (nonatomic,copy) NSString *statusCode;
/* 响应数据 */
@property (nonatomic,copy) NSData    *responseData;
@property (nonatomic,copy) NSString  *mineType;
@property (nonatomic,copy) NSString  *startTime;
@property (nonatomic,copy) NSString  *totalDuration;
/* 已读标识，0-未读 1-已读 */
@property (nonatomic, assign) short readFlag;
/* 是否是图片 */
@property (nonatomic, assign) BOOL isImage;
/* 图片 */
@property (nonatomic, strong) UIImage *image;
/* 上行流量(header+body) */
@property (nonatomic, copy) NSString *uploadFlow;
/* 下行流量(头部+body) */
@property (nonatomic, copy) NSString *downFlow;

+ (instancetype)httpModelWithResponseData:(NSData *)respnseData response:(NSHTTPURLResponse *)response request:(NSURLRequest *)request;
@end



