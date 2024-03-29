//
//  BSCommonTool.m
//  BadmintonShow
//
//  Created by lizhihua on 12/16/15.
//  Copyright © 2015 LZH. All rights reserved.
//

#import "BSCommonTool.h"

@implementation BSCommonTool

+ (UIBarButtonItem *)createRightBarButtonItem:(NSString *)title target:(id)obj selector:(SEL)selector ImageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *barButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButtonItem setImage:image forState:UIControlStateNormal];
    [barButtonItem setTitle:title forState:UIControlStateNormal];
    barButtonItem.titleLabel.font = [UIFont systemFontOfSize:18];
    [barButtonItem setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [barButtonItem setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [barButtonItem addTarget:obj action:selector forControlEvents:UIControlEventTouchUpInside];
    [barButtonItem sizeToFit];
    
    //iOS7之前的版本需要手动设置和屏幕边缘的间距
    if (kSystemVersion < 7.0) {
        barButtonItem.frame = CGRectInset(barButtonItem.frame, -10, 0);
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:barButtonItem];
    return item;
}


+ (UIButton *)bottomButtomWithVC:(UIViewController *)VC {
    
    UIView *bottomBackgroundView = [UIView new];
    bottomBackgroundView.backgroundColor = RGB(240, 240, 240);
    bottomBackgroundView.frame = CGRectMake(0, VC.view.height - 64 - 45, kScreenWidth, 45);
    [VC.view addSubview:bottomBackgroundView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 5, kScreenWidth - 10, 35);
    button.backgroundColor = [UIColor blueColor];

    [bottomBackgroundView addSubview:button];
   
    
    return button;
}

@end
