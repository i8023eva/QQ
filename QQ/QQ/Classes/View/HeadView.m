//
//  HeadView.m
//  01-QQ聊天界面
//
//  Created by lyh on 15/10/28.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "HeadView.h"
#import "Group.h"

@interface HeadView ()

@property (nonatomic, weak) UILabel *countView;
@property (nonatomic, weak) UIButton *nameView;

@end

@implementation HeadView


+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    HeadView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[HeadView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}


- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        
        nameView.imageView.contentMode = UIViewContentModeCenter;
        nameView.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        UILabel *countView = [[UILabel alloc] init];
        countView.textAlignment = NSTextAlignmentRight;
        countView.textColor = [UIColor grayColor];
        [self.contentView addSubview:countView];
        self.countView = countView;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nameView.frame = self.bounds;
    
    CGFloat countY = 0;
    CGFloat countH = self.frame.size.height;
    CGFloat countW = 150;
    CGFloat countX = self.frame.size.width - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
}

- (void)setGroup:(Group *)group
{
    _group = group;
    
    [self.nameView setTitle:group.name forState:UIControlStateNormal];
    
    self.countView.text = [NSString stringWithFormat:@"%@/%lu", group.online, (unsigned long)group.friends.count];
}


- (void)nameViewClick
{
    self.group.isOpen = !self.group.isOpen;
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
    }
}

- (void)didMoveToSuperview
{
    if (self.group.isOpen) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
