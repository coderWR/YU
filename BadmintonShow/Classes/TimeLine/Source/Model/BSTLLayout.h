//
//  BSTLLayout.h
//  BadmintonShow
//
//  Created by lizhihua on 12/25/15.
//  Copyright © 2015 LZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTLModel.h"

#define kT1CellPadding 12
#define kT1CellInnerPadding 6
#define kT1CellExtendedPadding 30
#define kT1AvatarSize 48
#define kT1ImagePadding 4
#define kT1ConversationSplitHeight 25
#define kT1ContentLeft (kT1CellPadding + kT1AvatarSize + kT1CellInnerPadding)
#define kT1ContentWidth (kScreenWidth - 2 * kT1CellPadding - kT1AvatarSize - kT1CellInnerPadding)
#define kT1QuoteContentWidth (kT1ContentWidth - 2 * kT1CellPadding)
#define kT1ActionsHeight 6
#define kT1TextContainerInset 4

#define kT1UserNameFontSize 14
#define kT1UserNameSubFontSize 12
#define kT1TextFontSize 14
#define kT1ActionFontSize 12

#define kT1UserNameColor UIColorHex(292F33)
#define kT1UserNameSubColor UIColorHex(8899A6)
#define kT1CellBGHighlightColor [UIColor colorWithWhite:0.000 alpha:0.041]
#define kT1TextColor UIColorHex(292F33)
#define kT1TextHighlightedColor UIColorHex(1A91DA)
#define kT1TextActionsColor UIColorHex(8899A6)
#define kT1TextHighlightedBackgroundColor UIColorHex(ebeef0)

#define kT1TextActionRetweetColor UIColorHex(19CF86)
#define kT1TextActionFavoriteColor UIColorHex(FAB81E)


//  layouts
@interface BSTLLayout : NSObject

@property (nonatomic, strong) BSTLModel *tweet;

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat paddingTop;
@property (nonatomic, assign) CGFloat textTop;
@property (nonatomic, assign) CGFloat textHeight;
@property (nonatomic, assign) CGFloat imagesTop;
@property (nonatomic, assign) CGFloat imagesHeight;

@property (nonatomic, assign) BOOL showTopLine;

@property (nonatomic, strong) YYTextLayout *nameTextLayout;
@property (nonatomic, strong) YYTextLayout *dateTextLayout;
@property (nonatomic, strong) YYTextLayout *textLayout;

@property (nonatomic, strong) YYTextLayout *retweetCountTextLayout;
@property (nonatomic, strong) YYTextLayout *favoriteCountTextLayout;

@property (nonatomic, strong) NSArray *images; // Array<BSTLMedia
@property (nonatomic, readonly) BSTLModel *displayedTweet;

- (YYTextLayout *)retweetCountTextLayoutForTweet:(BSTLModel *)tweet;
- (YYTextLayout *)favoriteCountTextLayoutForTweet:(BSTLModel *)tweet;

@end

 