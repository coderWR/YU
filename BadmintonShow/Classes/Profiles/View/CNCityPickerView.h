//
//  CNCityPickerView.h
//  CNCityPickerView
//
//  Created by 伟明 毕 on 15/3/25.
//  Copyright (c) 2015年 Weiming Bi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAFFCustomModalView.h"

typedef void (^ResultBlock)(NSString *province, NSString *city, NSString *area);

/** 一个基于UIPickerView的中国城市选择器，简单易用。 By Weiming Bi */
@interface CNCityPickerView : PAFFCustomModalView //UIView


@property (nonatomic, copy) ResultBlock finishBlock;
@property (nonatomic, assign) BOOL hasScroll;


@property (strong, nonatomic, readonly) UIPickerView *pickerView;

/** 滚动Picker回调的块 */
@property (copy, nonatomic, readwrite) void (^valueChangedCallback)(NSString *province, NSString *city, NSString *area);

/** 设置滚动Picker回调的块 */
- (void)setValueChangedCallback:(void (^)(NSString *province, NSString *city, NSString *area))valueChangedCallback;

// 下面属性为可选设置：

/** 每行的高度， 默认为24.0f */
@property (assign, nonatomic, readwrite) CGFloat rowHeight;

/**
 @{  NSForegroundColorAttributeName : [UIColor grayColor],
     NSFontAttributeName : [UIFont boldSystemFontOfSize:18.0f] }
 */
@property (strong, nonatomic, readwrite) NSDictionary *textAttributes;


+ (instancetype)createPickerViewWithFrame:(CGRect)frame valueChangedCallback:(void (^)(NSString *province, NSString *city, NSString *area))valueChangedCallback;

- (id)initWithframe:(CGRect)frame didSelected:(void (^)(NSString *province, NSString *city, NSString *area))finishBlock ;

@end

#pragma mark - Model

@interface CNCityAddressModel : NSObject
@property (strong, nonatomic) NSArray *sub;
@property (strong, nonatomic) NSString *name;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


@interface CNCityAddresCitiesModel : NSObject
@property (strong, nonatomic) NSArray *sub;
@property (strong, nonatomic) NSString *name;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

