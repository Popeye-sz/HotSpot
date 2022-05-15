//
//  HotSearchItem.m
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import "HotSearchItem.h"

@implementation HotSearchItem

+ (HotSearchItem *)itemWithDict:(NSDictionary *)dict {
    HotSearchItem *item = [[HotSearchItem alloc] init];
    item.title = [dict objectForKey:@"title"];
    item.urlString = [dict objectForKey:@"url"];
    item.hotDegree = [dict objectForKey:@"hot"];
    return item;
}

@end
