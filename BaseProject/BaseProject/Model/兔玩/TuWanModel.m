//
//  TuWanModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel

@end
@implementation TuWanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuWanDataIndexpicModel class],@"list":[TuWanDataIndexpicModel class]};
}

@end


@implementation TuWanDataIndexpicModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"typename1":@"typename",@"desc":@"description"};
}
@end


@implementation TuWanDataIndexpicInfochildModel

@end


@implementation TuWanDataIndexpicShowitemModel

@end


@implementation TuWanDataIndexpicShowitemInfoModel

@end






