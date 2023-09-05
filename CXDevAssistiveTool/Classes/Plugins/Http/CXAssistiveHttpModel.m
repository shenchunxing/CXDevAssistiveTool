//
//  CXAssistiveHttpModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/27.
//

#import "CXAssistiveHttpModel.h"
#import "CXAssistiveURLUtil.h"

@implementation CXAssistiveHttpModel

+ (instancetype)httpModelWithResponseData:(NSData *)respnseData response:(NSHTTPURLResponse *)response request:(NSURLRequest *)request {
    
    CXAssistiveHttpModel *model = [[CXAssistiveHttpModel alloc] init];
    
    model.url = request.URL;
    model.method = request.HTTPMethod;
    model.headerFields = request.allHTTPHeaderFields;
    NSData *httpBody = [CXAssistiveURLUtil getHttpBodyFromRequest:request];
    model.requestBody = [CXAssistiveURLUtil convertJsonFromData:httpBody];
    model.isImage = [response.MIMEType hasPrefix:@"image/"];
    model.mineType = response.MIMEType;
    model.statusCode = [NSString stringWithFormat:@"%d",(int)response.statusCode];
    model.responseData = respnseData;
    model.uploadFlow = [NSString stringWithFormat:@"%zi",[CXAssistiveURLUtil getRequestLength:request]];
    model.downFlow = [NSString stringWithFormat:@"%zi",[CXAssistiveURLUtil getResponseLength:response data:respnseData]];
    if (model.isImage) {
        model.image = [UIImage imageWithData:respnseData];
    }
    return model;
}

@end
