//
//  BSBaseBusiness.h
//  BadmintonShow
//
//  Created by lizhihua on 12/21/15.
//  Copyright © 2015 LZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSCommonBusiness : NSObject

+ (void)fetchUserInBackground:(void (^)(BSProfileUserModel *profileUserMoel, NSError *err))block;

@end
