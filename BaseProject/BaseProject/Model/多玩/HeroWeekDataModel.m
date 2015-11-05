//
//  HeroWeekDataModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroWeekDataModel.h"

@implementation HeroWeekDataModel

@end
@implementation HeroWeekDataDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"charts" : [HeroWeekDataDataChartsModel class]};
}

@end


@implementation HeroWeekDataDataChartsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ratio_data" : [HeroWeekDataDataChartsRatioDataModel class]};
}

@end


@implementation HeroWeekDataDataChartsRatioDataModel

@end


