//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"

#define kTuWanPath @"http://cache.tuwan.com/app/"
#define kAppid @"appid":@1
#define kClassmore @"classmore":@"indexpic"
#define kAppver @"appver":@2.1

@implementation TuWanNetManager
+(id)getInfoType:(InfoType)type start:(NSInteger)start kCompletionHandle{
    NSString *path = nil;
    NSDictionary  *params = nil;
    switch (type) {
        case InfoTypeTouTiao:
            path = kTuWanPath;
            params = @{kAppid,kClassmore,kAppver,@"start":@(start)};
            break;
        case InfoTypeDuJia:
            path = kTuWanPath;
            //class=heronews&mod=八卦
            params = @{kAppid,kAppver,@"class":@"heronews",@"mod":@"八卦",@"start":@(start)};
            break;
        case InfoTypeAnHei:
            path = kTuWanPath;
            //dtid=83623
            params = @{kAppid,kAppver,kClassmore,@"dtid":@"83623",@"start":@(start)};
            break;
        case InfoTypeMoShou:
            path = kTuWanPath;
            params = @{kAppid,kAppver,kClassmore,@"dtid":@"31537",@"start":@(start)};
            break;
        case InfoTypeFengBao:
            path = kTuWanPath;
            params = @{kAppid,kAppver,kClassmore,@"dtid":@"31538",@"start":@(start)};
            break;
        case InfoTypeLuShi:
            path = kTuWanPath;
            params = @{kAppid,kAppver,kClassmore,@"dtid":@"31528",@"start":@(start)};
            break;
        case InfoTypeXingJi:
            path = kTuWanPath;
            params = @{kAppid,kAppver,@"dtid":@"91821",@"start":@(start)};
            break;
        case InfoTypeShouWang:
            path = kTuWanPath;
            params = @{kAppid,kAppver,@"dtid":@"57067",@"start":@(start)};
            break;
        case InfoTypeTuPian:
            path = kTuWanPath;
            //type=pic
            params = @{kAppid,kAppver,@"dtid":@"83623,31528,31537,31538,57067,91821",@"type":@"pic",@"start":@(start)};
            break;
        case InfoTypeShiPin:
            path = kTuWanPath;
            params = @{kAppid,kAppver,@"dtid":@"83623,31528,31537,31538,57067,91821",@"type":@"video",@"start":@(start)};
            break;
        case InfoTypeGongLue:
            path = kTuWanPath;
            params = @{kAppid,kAppver,@"dtid":@"83623,31528,31537,31538,57067,91821",@"type":@"guide",@"start":@(start)};
            break;
        case InfoTypeHuanHua:
            path = kTuWanPath;
            params = @{kAppid,kAppver,@"class":@"heronews",@"mod":@"幻化",@"start":@(start)};
            break;
        case InfoTypeQuWen:
            path = kTuWanPath;
            params = @{kAppid,kAppver,kClassmore,@"class":@"heronews",@"mod":@"趣闻",@"dtid":@"0",@"start":@(start)};
            break;
        case InfoTypeCOS:
            path = kTuWanPath;
            params = @{kAppid,kAppver,kClassmore,@"class":@"cos",@"mod":@"cos",@"dtid":@"0",@"start":@(start)};
            break;

        case InfoTypeMeiNv:
            path = kTuWanPath;
            //typechild=cos1
            params = @{kAppid,kAppver,kClassmore,@"class":@"heronews",@"mod":@"美女",@"typechild":@"cos1",@"start":@(start)};
            break;

        default:
            break;
    }
    path = [self percentPathWithPath:path params:params];
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj],error);
    }];
}

//http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
//http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=11
/*
 URL的结构是?号之前是地址,?号之后是参数
 path:http://cache.tuwan.com/app/
 params:@{@"appid":@1,@"class":@"heronews"};
 */
//方法:把 path 和参数拼接起来,把字符串中的中文转换为 百分号 形式,因为有的服务器不接收中文编码
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params
{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    /*
     习惯
     for(int i = 0; i < params.allKeys.count; i++)
     假设 for 循环1000次, params.allKeys 实际上调用的[ params allKeys],会调用 allKeys1000次. OC 语言的特性是 runtime, 实际上我们调用一个方法,底层操作是 在一个方法列表中搜索你调用的方法所在的地址,然后调用完毕之后把这个方法名转移到常用方法列表.所以如果再次执行某个方法就在常用方法列表中搜索调用,效率更高.
     */
    
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else
        {
            [percentPath appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //把字符串中的中文转换为%号形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
