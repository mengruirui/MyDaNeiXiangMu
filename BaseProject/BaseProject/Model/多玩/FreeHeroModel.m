//
//  FreeHeroModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel


+ (NSDictionary *)objectClassInArray{
    return @{@"free" : [FreeHeroFreeModel class]};
}
@end
@implementation FreeHeroFreeModel

@end


