//
//  TableViewCell.h
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HotSearchItem;

@interface TableViewCell : UITableViewCell

- (void)configureWithModel:(HotSearchItem *)model;

@end

NS_ASSUME_NONNULL_END
