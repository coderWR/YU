
//
//  BSAddGameBusiness.m
//  BadmintonShow
//
//  Created by LZH on 15/11/18.
//  Copyright © 2015年 LZH. All rights reserved.
//

#import "BSAddGameBusiness.h"
#import "BSGameModel.h"
#import <AVOSCloud/AVObject.h>


@implementation BSAddGameBusiness


+ (AVObject *)AVObjectWithGameModel:(BSGameModel *)game
{
    AVObject *gameObj = [AVObject objectWithClassName:@"TempGame"];
    
    gameObj[@"playerA_score"]     =  game.playerA_score;//  玩家A的每场比赛得分
    gameObj[@"playerB_score"]     =  game.playerB_score;//  玩家B的每场比赛得分
    gameObj[@"gameType"]          =  @(game.gameType);  // 比赛的类型
    gameObj[@"playerA_objectId"]  =  game.playerA_objectId;
    gameObj[@"playerB_objectId"]  =  game.playerB_objectId;
    gameObj[@"winner_objectId"]   =  game.winner_objectId;
    gameObj[@"playerA_name"]      =  game.playerA_name;
    gameObj[@"playerB_name"]      =  game.playerB_name;
    gameObj[@"startTime"]         =  game.startTime = self.currentDateString;
    gameObj[@"endTime"]           =  game.endTime = self.currentDateString ;
    gameObj[@"winner_objectId"]   =  game.winner_objectId = game.playerA_objectId;
    
    return gameObj;
}

+ (NSString *)currentDateString{
    NSString *currentDateStr = [self.dateFormatter stringFromDate:[NSDate date]];
    return currentDateStr;
}

+ (NSDateFormatter *)dateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return dateFormatter;
}


@end

