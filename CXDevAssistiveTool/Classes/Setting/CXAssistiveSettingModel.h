//
//  CXAssistiveSettingModel.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/19.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveSettingModel : NSObject<NSCoding>

/* <#mark#> */
@property (nonatomic, copy) NSString *title;
/* <#mark#> */
@property (nonatomic, copy) NSString *detail;
/* <#mark#> */
@property (nonatomic, assign) BOOL isOn;
/* <#备注#> */
@property (nonatomic, strong) RACSubject *switchSignal;

+ (instancetype)settingModelWithTitle:(NSString *)title detail:(NSString *)detail;
@end

NS_ASSUME_NONNULL_END
