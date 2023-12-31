//
//  CXAssistiveHttpCell.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/3.
//

#import "CXAssistiveHttpCell.h"
#import <Masonry/Masonry.h>
#import "CXAssistiveHttpModel.h"
#import "UIFont+AssistiveFont.h"
#import "UIColor+AssistiveColor.h"
#import "UIImage+AssistiveBundle.h"

@interface CXAssistiveHttpCell ()

/* <#mark#> */
@property (nonatomic, strong) UIView *containerView;

/* uiim */
@property (nonatomic, strong) UIImageView *flagImg;
@end

@implementation CXAssistiveHttpCell

+ (CGFloat)heightForHttpCell {
    return 80.0;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.containerView];
        [self.containerView addSubview:self.titleLbl];
        [self.containerView addSubview:self.detailLbl];
        [self.containerView addSubview:self.flagImg];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 1, 0));
        }];
        [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(10);
            make.top.equalTo(self.containerView).offset(16);
            make.height.mas_equalTo(20);
        }];
        [self.detailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLbl);
            make.top.equalTo(self.titleLbl.mas_bottom).offset(8);
            make.height.mas_equalTo(20);
        }];
        [self.flagImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.containerView);
            make.trailing.offset(-10);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
    }
    return self;
}

- (void)bindHttpModel:(CXAssistiveHttpModel *)model {
    
    self.titleLbl.text = model.url.host;
    self.detailLbl.text = [model.url.path substringWithRange:NSMakeRange(1, model.url.path.length-1)];
    self.flagImg.image = model.readFlag == 1 ? [UIImage as_imageWithName:@"icon_read_tag"]:[UIImage as_imageWithName:@"icon_unread_tag"];
}

#pragma mark - getter
- (UIView *)containerView {
    
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor as_cellColor];
    }
    return _containerView;
}
- (UILabel *)titleLbl {
    
    if (_titleLbl == nil) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor whiteColor];
        _titleLbl.font = [UIFont as_15];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLbl;
}
- (UILabel *)detailLbl {
    
    if (_detailLbl == nil) {
        _detailLbl = [[UILabel alloc] init];
        _detailLbl.textColor = [UIColor whiteColor];
        _detailLbl.font = [UIFont as_13];
        _detailLbl.textAlignment = NSTextAlignmentLeft;
        _detailLbl.numberOfLines = 0;
    }
    return _detailLbl;
}

- (UIImageView *)flagImg {
    
    if (_flagImg == nil) {
        _flagImg = [[UIImageView alloc] init];
        
    }
    return _flagImg;
}
@end
