//
//  HeadView.h
//  01-QQ聊天界面
//
//  Created by lyh on 15/10/28.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Group;
@class HeadView;

@protocol HeadViewDelegate <NSObject>
@optional
- (void)headerViewDidClickedNameView:(HeadView *)headerView;
@end
@interface HeadView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) id<HeadViewDelegate> delegate;

@property (nonatomic, strong) Group *group;

@end

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    static NSString *ID = @"cell";
//     // 头部和尾部和 cell 一样不会消失 , 进入缓冲池
//    UITableViewHeaderFooterView *hader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
//}
