//
//  FriendTableViewCell.m
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "FriendTableViewCell.h"
#import "Friends.h"

@implementation FriendTableViewCell

+(instancetype) cellWithTableView: (UITableView *)tableView sourceData: (Friends *)friends {
    static NSString *ID = @"cell";
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = friends.name;
    cell.imageView.image = [UIImage imageNamed:friends.icon];
    
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
