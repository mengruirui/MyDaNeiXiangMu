//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanRequestPath.h"
//很多具有共同点的东西,可以统一宏定义,比如
//凡是自己写的宏定义 都需要用 k 开头,这是编码习惯
#define kOSType @"OSType":[@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion]//9.1是当前手机系统版本,需要到 info 文件中去取

#define kVersionName @"versionName":@"2.4.0"

#define kV @"v":@140

//把 path 写到文件头部,使用宏定义形式,方便后期维护





@implementation DuoWanNetManager
+(id)getFreeAndAllHeroType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = nil;
    switch (type) {
        case HeroTypeFree: {
            //type=free&v=140&OSType=iOS9.1
            params = @{@"type":@"free",kV,kOSType};
            return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
            }];

            break;
        }
        case HeroTypeAll: {
            //type=all&v=140&OSType=iOS9.1
            params = @{@"type":@"all",kV,kOSType};
            return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        default: {
            return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle(nil,error);
            }];

            break;
        }
    }
}

+(id)getHeroSkinWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    //hero=Braum&v=140&OSType=iOS9.1&versionName=2.4.0
    NSDictionary *params = @{kV,kOSType,kVersionName,@"hero":name};
    return [self GET:kHeroSkinPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroVideoWithPageId:(NSInteger)pageId tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle
{
    //action=l&p=1&v=140&OSType=iOS9.1&tag=Braum&src=letv
    NSDictionary *params = @{@"action":@"l",@"p":@(pageId),kV,kOSType,@"tag":enName,@"src":@"letv"};
    return [self GET:kHeroVideoPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroSoundWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"hero":name,kV,kOSType,kVersionName};
    //hero=Braum&v=140&OSType=iOS9.1&versionName=2.4.0
    return [self GET:kHeroSoundPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj,error);
    }];
}

+(id)getHeroCZWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
  NSDictionary *params = @{@"championName":name,@"limit":@"7",kV,kOSType};
    //v=140&OSType=iOS9.1&championName=Braum&limit=7
  return  [self GET:kHeroCZPath parameters:params completionHandler:^(id responseObj, NSError *error) {
      completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroDetailWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    //OSType=iOS9.1&heroName=Braum&v=140
    NSDictionary *params = @{@"heroName":name,kOSType,kV};
    return [self GET:kHeroDetailPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroDetailModel objectWithKeyValues:responseObj],error);
    }];
}
+(id)getHeroGiftWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    //hero=Braum&v=140&OSType=iOS9.1
    NSDictionary *params = @{@"hero":name,kV,kOSType};
    return [self GET:kHeroGiftPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getHeroChangeWithEnName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{};
    return [self GET:HeroChangePath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getHeroWeekDataWithHeroId:(NSInteger)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    //heroId=72
    NSDictionary *params = @{@"heroId":@(ID)};
    return [self GET:HeroWeekDataPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{kV, kVersionName, kOSType, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+(id)getZBCCategroyCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{kV,kOSType,kVersionName};
    return [self GET:kZBCCategoryPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+ (id)getZBItemWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    //tag=consumable&v=140&OSType=iOS9.1&versionName=2.4.0
    NSDictionary *params = @{@"tag":tag,kV,kOSType,kVersionName};
    return [self GET:kZBItemPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+ (id)getItemDetailWithId:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    //id=3004&v=140&OSType=iOS9.1
    NSDictionary *params = @{@"id":ID,kV,kOSType};
    return [self GET:kItemDetailPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getGiftCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{kV,kOSType};
    return [self GET:GiftPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GiftModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getRuneCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    //v=140&OSType=iOS9.1
    NSDictionary *params = @{kV,kOSType};
    return [self GET:RunePath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RuneModel objectWithKeyValues:responseObj],error);
    }];

}

+(id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{kV,kOSType};
    return [self GET:SumAbilityPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];

}

+(id)getBestGoupCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{kV,kOSType};
    return [self GET:BestGroupPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];

}
@end
