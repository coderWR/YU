//
//  BSCircleDetailController.h
//  BadmintonShow
//
//  Created by lizhihua on 12/27/15.
//  Copyright © 2015 LZH. All rights reserved.
//  圈子详情--头像，名称，ID，简介，人数

#import "BSBaseTableViewController.h"
#import "BSCircleModel.h"

typedef void (^JionCircleSuccessBlock)(void );

@interface BSCircleDetailController : BSBaseTableViewController
@property (nonatomic, strong) BSCircleModel *circle;
@property (nonatomic, copy) JionCircleSuccessBlock block;
@end
