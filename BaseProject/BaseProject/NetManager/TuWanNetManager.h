//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
//只要共用一个解析类的请求,就可以合起来写,只需要使用枚举变量,来决定不同的请求地址即可
//可以参考汽车之家接口
typedef NS_ENUM(NSUInteger, InfoType) {
    InfoTypeTouTiao,//头条
    InfoTypeDuJia,//独家
    InfoTypeAnHei,
    InfoTypeMoShou,
    InfoTypeFengBao,
    InfoTypeLuShi,
    InfoTypeXingJi,
    InfoTypeShouWang,
    InfoTypeTuPian,
    InfoTypeShiPin,
    InfoTypeGongLue,
    InfoTypeHuanHua,
    InfoTypeQuWen,
    InfoTypeCOS,
    InfoTypeMeiNv,
};
@interface TuWanNetManager : BaseNetManager
+ (id)getInfoType:(InfoType)type start:(NSInteger)start kCompletionHandle;
@end
