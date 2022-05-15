//
//  WebViewController.h
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HotSearchItem;

@interface WebViewController : UIViewController
- (instancetype)initWithFrame:(CGRect)frame model:(HotSearchItem *)model;
@end

NS_ASSUME_NONNULL_END
