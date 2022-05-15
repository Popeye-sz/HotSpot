//
//  DataLoader.m
//  HotSpot
//
//  Created by 何青 on 2022/5/14.
//

#import "DataLoader.h"
#import "HotSearchItem.h"

@implementation DataLoader

+ (void)loadDataWithCompletion:(CompletionBlock)completion {
    //微博热搜的公开接口，不保证永久可用，有可能会随时失效
    //https://api.vvhan.com/api/wbhot
    NSURL *url = [NSURL URLWithString:@"https://api.vvhan.com/api/wbhot"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data) {
            //成功返回, data to json
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if ([json objectForKey:@"success"]) {
                NSMutableArray *result = [NSMutableArray new];
                NSArray *datas = [json objectForKey:@"data"];
                for (data in datas) {
                    HotSearchItem *item = [HotSearchItem itemWithDict:(NSDictionary *)data];
                    [result addObject:item];
                }
                if (completion) {
                    completion([result copy]);
                }
            } else {
                NSLog(@"Get data failed : %ld - %@",  (long)error.code, error.userInfo);
                if (completion) {
                    // 获取失败，返回空
                    completion(@[]);
                }
            }
        } else {
            NSLog(@"Get data failed : %ld - %@",  (long)error.code, error.userInfo);
            if (completion) {
                // 获取失败，返回空
                completion(@[]);
            }
        }
    }];
    [task resume];
}

@end
