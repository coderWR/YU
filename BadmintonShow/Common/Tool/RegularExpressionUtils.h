//
//  RegularExpressionUtils.h
//  BadmintonShow
//
//  Created by lzh on 15/6/26.
//  Copyright (c) 2015年 LZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularExpressionUtils : NSObject

//数字
+ (BOOL) validateNumberString:(NSString *)string;
//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;
//银行卡后四位
+ (BOOL) validateBankCardLastNumber: (NSString *)bankCardNumber;
//CVN
+ (BOOL) validateCVNCode: (NSString *)cvnCode;
//month
+ (BOOL) validateMonth: (NSString *)month;
//month
+ (BOOL) validateYear: (NSString *)year;
//verifyCode
+ (BOOL) validateVerifyCode: (NSString *)verifyCode;
@end
