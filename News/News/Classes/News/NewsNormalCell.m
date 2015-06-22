//
//  NewsNormalCell.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NewsNormalCell.h"
#import "NewsModel.h"
#import <UIImageView+AFNetworking.h>
@interface NewsNormalCell()


@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *digestLable;
@property (weak, nonatomic) IBOutlet UILabel *replayLable;
@property (weak, nonatomic) IBOutlet UILabel *souceLable;

@end

@implementation NewsNormalCell

-(void)setNewsModel:(NewsModel *)NewsModel{

    _NewsModel = NewsModel;
    self.titleLable.text = NewsModel.title;
    self.digestLable.text = NewsModel.digest;
    self.replayLable.text = [NSString stringWithFormat:@"%zd", NewsModel.replyCount];
    if (NewsModel.source) {
        self.souceLable.text = NewsModel.source;
    }else{
    
        self.souceLable.text = @"本报";
    }

    NSLog(@"NewsModel.source=%@",NewsModel.source);
    
    [self.iconImage setImageWithURL:[NSURL URLWithString:NewsModel.imgsrc]];
    
    
    
}
- (void)awakeFromNib {
    // Initialization code
    self.digestLable.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width -self.digestLable.frame.origin.x - 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
