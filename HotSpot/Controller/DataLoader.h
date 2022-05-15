//
//  DataLoader.h
//  HotSpot
//
//  Created by 何青 on 2022/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletionBlock)(NSArray *resultArray);

@interface DataLoader : NSObject

+ (void)loadDataWithCompletion:(CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
