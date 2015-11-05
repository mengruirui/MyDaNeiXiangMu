//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"
#define kRankingPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
//device=iPhone&key=ranking:album:played:1:2&pageId=1&pageSize=20&position=0&title=排行榜

#define kAlbumPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"

@implementation XiMaNetManager
+(id)getRankingWithPageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"device":@"iPhone",@"key":@"ranking:album:played:1:2",@"pageId":@(pageId),@"pageSize":@"20",@"position":@"0",@"title":@"排行榜"};
    return [self GET:kRankingPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel objectWithKeyValues:responseObj],error);
    }];

}

+(id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:kAlbumPath,@(ID),@(pageId)];
    NSDictionary *params = @{@"device":@"iPhone"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel objectWithKeyValues:responseObj],error);
    }];
}


@end
