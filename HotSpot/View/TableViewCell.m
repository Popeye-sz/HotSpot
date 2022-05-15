//
//  TableViewCell.m
//  HotSpot
//
//  Created by 何青 on 2022/5/15.
//

#import "TableViewCell.h"
#import "HotSearchItem.h"

@interface TableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *hotLabel;
@property (strong, nonatomic) UILabel *hotNumLabel;
@property (strong, nonatomic) NSString *urlString;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 48)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor whiteColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.hotLabel.font = [UIFont systemFontOfSize:12];
            self.hotLabel.textColor = [UIColor grayColor];
            self.hotLabel;
        })];
        [self.contentView addSubview:({
            self.hotNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 80, 20)];
            self.hotNumLabel.font = [UIFont systemFontOfSize:12];
            self.hotNumLabel.textColor = [UIColor grayColor];
            self.hotNumLabel;
        })];
    }
    return self;
}

- (void)configureWithModel:(HotSearchItem *)model {
    _hotLabel.text = @"热度";
    _titleLabel.text = model.title;
    _hotNumLabel.text = model.hotDegree;
    _urlString = model.urlString;
}

@end
