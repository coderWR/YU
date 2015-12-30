//
//  BSCircleDetailHeader.m
//  BadmintonShow
//
//  Created by lizhihua on 12/27/15.
//  Copyright © 2015 LZH. All rights reserved.
//

#import "BSCircleDetailHeader.h"
#import "BSCircelModel.h"

@interface BSCircleDetailHeader ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *circleIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIImageView *creatorAvatarView;
@property (weak, nonatomic) IBOutlet UILabel *creatorUserName;

@property (weak, nonatomic) IBOutlet UIImageView *adminOneAvatarView;
@property (weak, nonatomic) IBOutlet UIImageView *adminTwoAvatarView;
@property (weak, nonatomic) IBOutlet UIButton *peopleCountButton;

@property (weak, nonatomic) BSCircelModel *circle;
@end

@implementation BSCircleDetailHeader



- (id)init{
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"BSCircleDetailHeader" owner:nil options:nil] lastObject];
    self.avatarView.layer.cornerRadius = 96 / 2.0;
    self.avatarView.clipsToBounds = YES;
    self.creatorAvatarView.layer.cornerRadius = 48 / 2.0;
    self.creatorAvatarView.clipsToBounds = YES;
    self.adminOneAvatarView.layer.cornerRadius = 48 / 2.0;
    self.adminOneAvatarView.clipsToBounds = YES;
    self.adminTwoAvatarView.layer.cornerRadius = 48 / 2.0;
    self.adminTwoAvatarView.clipsToBounds = YES;
    
    self.creatorAvatarView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        if (!self.circle.creator) return;
        
        if ([self.delegate respondsToSelector:@selector(circleDetailHeader:didClickCreator:) ]) {
            [self.delegate circleDetailHeader:self didClickCreator:self.circle.creator];
        }
    }];
    [self.creatorAvatarView addGestureRecognizer:tap];
    
    return self;
}

- (IBAction)peopleCountAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didClickPeopleCountButton) ]) {
        [self.delegate didClickPeopleCountButton];
    }
}

- (IBAction)clickCreatorAction:(id)sender {
   

}
- (void)setObject:(id)object {
    if ([object isKindOfClass:[BSCircelModel class]]) {
        BSCircelModel *circle = (BSCircelModel *)object;
        [self.avatarView setImageWithURL:circle.avatarUrl placeholder:kImageUserAvatar];
        self.circleIdLabel.text = circle.circleId;
        self.createdAtLabel.text = [circle.createdAt toDateString];
        self.addressLabel.text = circle.address; 
        self.descLabel.text = circle.desc;
        [self.creatorAvatarView setImageWithURL:[NSURL URLWithString:circle.creator.avatarUrl] placeholder:kImageUserAvatar];
        self.creatorUserName.text = circle.creator.userName;
        NSString *title = [NSString stringWithFormat:@"%ld >",circle.peopleCount];
        [self.peopleCountButton setTitle:title forState:UIControlStateNormal];
        
        self.circle = circle;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
