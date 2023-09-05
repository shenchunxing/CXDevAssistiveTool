//
//  CXScreenShotDefine.h
//  Pods
//
//  Created by shenchunxing on 2021/9/10.
//

#ifndef CXScreenShotDefine_h
#define CXScreenShotDefine_h

typedef NS_ENUM(NSUInteger, CXScreenShotAction) {
    CXScreenShotActionNone      = 0,    //无
    CXScreenShotActionRect      = 1,    //框
    CXScreenShotActionRound     = 2,    //圈
    CXScreenShotActionLine      = 3,    //线
    CXScreenShotActionDraw      = 4,    //画
    CXScreenShotActionText      = 5,    //文本
    CXScreenShotActionRevoke    = 6,    //撤销
    CXScreenShotActionCancel    = 7,    //取消
    CXScreenShotActionConfirm   = 8     //确认
};

typedef NS_ENUM(NSUInteger, CXScreenShotStyle) {
    CXScreenShotStyleSmall = 0,
    CXScreenShotStyleMedium,
    CXScreenShotStyleBig,
    CXScreenShotStyleRed,       //ff3b30
    CXScreenShotStyleBlue,      //108efff
    CXScreenShotStyleGreen,     //59b50a
    CXScreenShotStyleYellow,    //f4a500
    CXScreenShotStyleGray,      //333333
    CXScreenShotStyleWhite      //ffffff
};


#endif /* CXScreenShotDefine_h */
