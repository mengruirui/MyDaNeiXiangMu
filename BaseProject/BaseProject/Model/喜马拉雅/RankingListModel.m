//
//  RankingListModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankingListModel.h"

@implementation RankingListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RankingListListModel class]};
}
@end

@implementation RankingListListModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
@end


