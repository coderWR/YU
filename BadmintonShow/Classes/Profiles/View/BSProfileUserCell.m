//
//  BSProfileUserCell.m
//  BadmintonShow
//
//  Created by lizhihua on 12/14/15.
//  Copyright © 2015 LZH. All rights reserved.
//

#import "BSProfileUserCell.h"
#import "BSProfileUserModel.h"
#import "Masonry.h"
#import "YYKit.h"

#define iconRadius 72
#define kNickNameLabelFont [UIFont systemFontOfSize:18]
#define kYuxiuLabelFont [UIFont systemFontOfSize:14]
#define kYuxiuLabelColor [UIColor grayColor]
#define kCellPadding 10
#define kCellInnerPadding 5


@implementation BSProfileUserCell {
    UILabel *_nickNameLabel;
    UILabel *_yuxiuLabel;
    UIImageView *_iconView;
    UIView *_bottomLine;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self constructSubViews];
    }
    return self;
}

- (void)constructSubViews{
    self.contentView.backgroundColor = [UIColor whiteColor];
    //  头像
    UIImageView *iconView = [UIImageView new];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.layer.cornerRadius =  kBSAvatarRadius;
    iconView.clipsToBounds = YES ;
    [self.contentView addSubview:iconView];
    _iconView = iconView;
    
    // 昵称
    UILabel *nickNameLabel = [UILabel new];
    nickNameLabel.font = kNickNameLabelFont;
    [self.contentView addSubview:nickNameLabel];
    _nickNameLabel = nickNameLabel;
    
    // 羽秀账号 (字母+数字)
    UILabel *yuxiuPlaceHolder = [UILabel new];
    yuxiuPlaceHolder.font = kYuxiuLabelFont;
    yuxiuPlaceHolder.text = @"羽秀号:";
    yuxiuPlaceHolder.textColor = kYuxiuLabelColor;
    [self.contentView addSubview:yuxiuPlaceHolder];
    
    UILabel *yuxiuLabel = [UILabel new];
    yuxiuLabel.font = kYuxiuLabelFont;
    yuxiuLabel.textColor = kYuxiuLabelColor;
    [self.contentView addSubview:yuxiuLabel];
    _yuxiuLabel = yuxiuLabel;
    
    _bottomLine = [UIView new];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_bottomLine];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(kCellPadding);
        make.width.equalTo(@(iconRadius));
        make.height.equalTo(@(iconRadius));
    }];
    
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(kCellPadding);
        make.top.equalTo(iconView).offset(kCellPadding);
    }];
    
    [yuxiuPlaceHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickNameLabel);
        make.top.equalTo(nickNameLabel.mas_bottom).offset(kCellPadding);
    }];
    
    
    [yuxiuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yuxiuPlaceHolder);
        make.left.equalTo(yuxiuPlaceHolder.mas_right).offset(kCellInnerPadding);
    }];
    
    
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@(0.5));
    }];
    
}

- (void)displayWithItem:(id)object{
    if ([object isKindOfClass:[BSProfileUserModel class]]) {
        BSProfileUserModel *user = (BSProfileUserModel *)object;
        _nickNameLabel.text = user.userName ? : @" ";
        _yuxiuLabel.text = user.yuxiuId ? : @" ";
        UIImage *placeholder =  [UIImage imageNamed:kDefaultUserAvatar];
        [_iconView setImageWithURL:[NSURL URLWithString:user.avatarUrl] placeholder:placeholder];
    }
}
@end
