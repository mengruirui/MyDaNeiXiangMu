//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface XiMaNetManager : BaseNetManager
+ (id)getRankingWithPageId:(NSInteger)pageId kCompletionHandle;

+ (id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId kCompletionHandle;
@end
