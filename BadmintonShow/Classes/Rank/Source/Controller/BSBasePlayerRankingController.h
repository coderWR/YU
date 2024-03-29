//
//  BSBasePlayerRankingController.h
//  BadmintonShow
//
//  Created by lizhihua on 12/22/15.
//  Copyright © 2015 LZH. All rights reserved.
//  排名基类

#import "BSBaseViewController.h"
#import "BSSkyLadderHeaderView.h"
#import "MJRefresh.h"

@interface BSBasePlayerRankingController : BSBaseViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *_rankArray ;
    BSSkyLadderHeaderView *_header;
    NSInteger _querySkip;
    NSInteger _querySuccessCount;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *showErrorLabel;
- (void)loadRankData;
- (void)loadMoreData;
    
@end
