//
//  FriendTableViewCell.h
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Friends;
@interface FriendTableViewCell : UITableViewCell

+(instancetype) cellWithTableView: (UITableView *)tableView sourceData: (Friends *)friends;
@end
