//
//  BSSkyLadderViewController.m
//  BadmintonShow
//
//  Created by lzh on 15/9/1.
//  Copyright (c) 2015年 LZH. All rights reserved.
//

#import "BSSkyLadderViewController.h"
#import "SVProgressHUD.h"

@interface BSSkyLadderViewController ()


@end

@implementation BSSkyLadderViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"羽秀·天梯";
}

@end

