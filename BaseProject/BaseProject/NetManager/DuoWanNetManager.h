//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"

typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeFree,//免费英雄
    HeroTypeAll,//全部英雄
};

@interface DuoWanNetManager : BaseNetManager

+(id)getFreeAndAllHeroType:(HeroType)type kCompletionHandle;//免费英雄和全部英雄

+(id)getHeroSkinWithEnName:(NSString *)name kCompletionHandle;//英雄皮肤

+(id)getHeroVideoWithPageId:(NSInteger)pageId tag:(NSString *)enName kCompletionHandle;//英雄视频

+(id)getHeroSoundWithEnName:(NSString *)name kCompletionHandle;//配音

+(id)getHeroCZWithEnName:(NSString *)name kCompletionHandle;//出装

+(id)getHeroDetailWithEnName:(NSString *)name kCompletionHandle;//英雄资料

+(id)getHeroGiftWithEnName:(NSString *)name kCompletionHandle;//天赋符文

+(id)getHeroChangeWithEnName:(NSString *)name kCompletionHandle;//英雄改动

+ (id)getHeroWeekDataWithHeroId:(NSInteger)ID kCompletionHandle;//一周数据

+ (id)getToolMenuWithCategory:(NSString *)tag kCompletionHandle;//游戏百科列表

+ (id)getToolMenuCompletionHandle:(void(^)(id model, NSError *error))completionHandle;//装备分类

+ (id)getZBItemWithTag:(NSString *)tag kCompletionHandle;//某分类装备列表

+ (id)getItemDetailWithId:(NSString *)ID kCompletionHandle;//装备详情

+ (id)getGiftCompletionHandle:(void(^)(id model,NSError *error))completionHandle;//天赋

+ (id)getRuneCompletionHandle:(void(^)(id model,NSError *error))completionHandle;//符文

+ (id)getSumAbilityCompletionHandle:(void(^)(id model,NSError *error))completionHandle;//召唤师技能表

+ (id)getBestGoupCompletionHandle:(void(^)(id model,NSError *error))completionHandle;;//最佳阵容
@end
