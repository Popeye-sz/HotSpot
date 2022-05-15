//
//  HotSearchItem.h
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotSearchItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSString *hotDegree;

+ (HotSearchItem *)itemWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
