//
//  BSMoreController.m
//  BadmintonShow
//
//  Created by lzh on 15/6/14.
//  Copyright (c) 2015年 LZH. All rights reserved.
//

#import "BSProfileController.h"
#import "BSProfileViewController.h"
#import "BSProfileEditViewController.h"
#import "BSProfileUserCell.h"
#import "BSProfileCell.h"
#import "BSProfileUserModel.h"
#import "BSProfileModel.h"

#import "CDUserManager.h"
#import <LCUserFeedbackAgent.h>
#import "UserDefaultManager.h"

#import "AVUser.h"
#import "YYKit.h"
#import "BSProfileBusiness.h"
#import "SVProgressHUD.h"
#import "BSMyEquipmentViewController.h"
#import "BSMyTeamsController.h"
#import "BSSettingViewController.h"
#import "BSCommonBusiness.h"
#import "BSMyCirclesController.h"
#import "BSMessageViewController.h"

@interface BSProfileController ()<BSProfileEditViewControllerDelegate>
//UITableViewDelegate,UITableViewDataSource,
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation BSProfileController{
    NSMutableArray *_dataArr;
    CGRect _iconOldFrame ;
}

- (instancetype)init {
    self = [super init ];
    if (self) {
        self.title = @"我的";
        self.hidesBottomBarWhenPushed = NO;
        self.tabBarItem.image = [UIImage imageNamed:@"iconfont-profile"];
        _dataArr = [NSMutableArray array];
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];

    [self getUserData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userChanged) name:kNotificationKeyUserChanged object:nil];
}

- (void)userChanged{
    [self getUserData];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES ;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO ;
//}

- (void)setting {
    BSSettingViewController *setting = [[BSSettingViewController alloc] init];
    setting.title = @"设置";
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)createData{
    
    [_dataArr addObject:@[AppContext.user]];
    
    NSString *clasName = @"UIViewController";
    
    // 相册/收藏
//    BSProfileModel *data = BSProfileModel(@"AliPay",@"我的数据",nil,clasName);
//    BSProfileModel *team = BSProfileModel(@"AliPay",@"我的球队",nil,@"BSMyTeamsController");
//    BSProfileModel *collection = BSProfileModel(@"AliPay",@"我的装备",nil,@"BSMyEquipmentViewController");
//    [_dataArr addObject:@[data,team,collection]];

//    BSProfileModel *message = BSProfileModel(@"more_icon_message",@"消息",nil,@"BSMessageViewController");
//    [_dataArr addObject:@[message]];
    
    BSProfileModel *circle = BSProfileModel(@"iconfont-group",@"我的圈子",nil,@"BSMyCirclesController");
        [_dataArr addObject:@[circle]];
    
    //  附近
//    BSProfileModel *peopleNearby = BSProfileModel(@"AliPay",@"附近的人",nil,clasName);
//    BSProfileModel *teamNearby = BSProfileModel(@"AliPay",@"附近球队",@"享受双打的乐趣",clasName);
//    BSProfileModel *groupNearby = BSProfileModel(@"AliPay",@"羽秀`圈子",@"到组织,找高手",clasName);
//    [_dataArr addObject:@[peopleNearby,teamNearby,groupNearby]];

    BSProfileModel *setting = BSProfileModel(@"iconfont-setting",@"设置",nil,@"BSSettingViewController");
    [_dataArr addObject:@[setting]];
     
    [self.tableView reloadData];
    
}

- (void)getUserData{
    
    [BSCommonBusiness fetchUserInBackground:^(BSProfileUserModel *profileUserMoel, NSError *err) {
        if (!profileUserMoel || err) {
//            [MBProgressHUD showText:@"获取数据异常" atView:self.view  animated:YES];
            return;
        }
        [self reloadDataWithUser];
    }];
}

- (void)reloadDataWithUser{
    [_dataArr removeFirstObject];
    [_dataArr prependObject:@[AppContext.user]];
    [self.tableView reloadData];
}

#pragma mark - TableView DataSource

#pragma mark Section Header

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 20 : 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

#pragma mark Cell

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionData = _dataArr[section];
    return sectionData.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) return 90;
    return 44;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSArray  *sectionData = _dataArr[indexPath.section];
    id object = sectionData[indexPath.row];
    
    if (indexPath.section == 0) {
        BSProfileUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BSProfileUserCell"];
        if (!cell) {
            cell = [[BSProfileUserCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:@"BSProfileUserCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.object = object;
        return cell;
        
    } else {
        BSProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BSProfileCell"];
        if (!cell) {
            cell = [[BSProfileCell  alloc] initWithStyle:UITableViewCellStyleValue1
                                         reuseIdentifier:@"BSProfileCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.object = object;
        return cell;
    }
    
}


#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (indexPath.section == 0) {
        BSProfileEditViewController *profileEditVC = [[ BSProfileEditViewController alloc] init];
        profileEditVC.title = @"个人信息";
        profileEditVC.delegate = self;
        [self.navigationController  pushViewController:profileEditVC animated:YES];
        return;
    }
    
    NSArray  *sectionData = _dataArr[indexPath.section];
    BSProfileModel *profile = sectionData[indexPath.row];
    Class class = NSClassFromString(profile.className);
    if (class) {
        UIViewController *ctrl = class.new ;
        ctrl.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:ctrl animated:YES];
    }

}



- (void)updateUseInfo{
    [self reloadDataWithUser];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
