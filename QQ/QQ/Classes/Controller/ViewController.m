//
//  ViewController.m
//  QQ
//
//  Created by lyh on 15/10/26.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ViewController.h"
#import "FriendTableViewCell.h"
#import "Group.h"
#import "Friends.h"
#import "HeadView.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, HeadViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *friendsArray;
@property (nonatomic, strong) NSArray *group;

@property (nonatomic, strong) HeadView *headView;

@end

@implementation ViewController

-(HeadView *)headView {
    if (_headView == nil) {
        _headView = [HeadView new];
    }
    return _headView;
}

-(NSArray *)group {
    if (_group == nil) {
        
        _group = [Group group];
    }
    return _group;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Group *group = self.group[section];
    
    return (group.isOpen ? group.friends.count : 0);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.group.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Group *group = self.group[indexPath.section];
    Friends *friend = group.friends[indexPath.row];
    
    FriendTableViewCell *cell = [FriendTableViewCell cellWithTableView:tableView sourceData:friend];
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HeadView *headView = [HeadView headerViewWithTableView:tableView];
    
    headView.delegate = self;
    
    headView.group  = self.group[section];
    
    return headView;
}

-(void)headerViewDidClickedNameView:(HeadView *)headerView {
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
