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
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *IconViews;

@end

@implementation NewsNormalCell

-(void)setNewsModel:(NewsModel *)NewsModel{

    _NewsModel = NewsModel;
    self.titleLable.text = NewsModel.title;
    self.digestLable.text = NewsModel.digest;
    self.replayLable.text = [NSString stringWithFormat:@"%zd", NewsModel.replyCount];
    self.souceLable.alpha = 0.6;
    if (NewsModel.source) {
        
        self.souceLable.textColor = [UIColor blackColor];
        self.souceLable.text = NewsModel.source;
    }else{
    
        self.souceLable.text = @"独家";
        self.souceLable.textColor = [UIColor blueColor];
    }

    //异步设置图像之前先清理缓存
    self.iconImage.image = nil;
    [self.iconImage setImageWithURL:[NSURL URLWithString:NewsModel.imgsrc]];
    //判断是不是有多图
    if (NewsModel.imgextra.count == 2) {
        for (int i =0 ; i< NewsModel.imgextra.count; i++) {
            NSDictionary *dic = NewsModel.imgextra[i];
            NSString *urlString = dic[@"imgsrc"];
            
           // NSString *deUrl = @"http://img4.imgtn.bdimg.com/it/u=2205791892,1328528914&fm=23&gp=0.jpg";
            //[self.IconViews[i] setImageWithURL:[NSURL URLWithString:deUrl]];
            [self.IconViews[i] setImageWithURL:[NSURL URLWithString:urlString]];
        }
    }
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
