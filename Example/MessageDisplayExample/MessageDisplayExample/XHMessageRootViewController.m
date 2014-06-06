//
//  XHMessageRootViewController.m
//  MessageDisplayExample
//
//  Created by qtone-1 on 14-4-26.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHMessageRootViewController.h"

#import "XHDemoWeChatMessageTableViewController.h"
#import "XHFoundationCommon.h"

#import "UIView+XHBadgeView.h"

#import "XHNewsTableViewController.h"

#import "XHChatPopMenuView.h"

@interface XHMessageRootViewController ()<XHChatPopMenuDelegate>

@property (nonatomic, retain) XHChatPopMenuView *popMenu;

@end

@implementation XHMessageRootViewController

#pragma mark - Action

- (void)enterMessage {
    XHDemoWeChatMessageTableViewController *demoWeChatMessageTableViewController = [[XHDemoWeChatMessageTableViewController alloc] init];
    [self.navigationController pushViewController:demoWeChatMessageTableViewController animated:YES];
}

- (void)enterNewsController {
    XHNewsTableViewController *newsTableViewController = [[XHNewsTableViewController alloc] init];
    [self pushNewViewController:newsTableViewController];
}

- (void)popMenu:(id)sender{
    if (_popMenu == nil) {
        _popMenu = [[XHChatPopMenuView alloc] initWithFrame:self.view.bounds];
        [_popMenu popInView:self.view];
        
    }else{
        [_popMenu dismiss];
        _popMenu = nil;
    }
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *dataSource = [[NSMutableArray alloc] initWithObjects:@"请问你现在在哪里啊？我在广州天河", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点进入聊天页面，这里有多种显示样式", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", @"请问你现在在哪里啊？我在广州天河", @"请问你现在在哪里啊？我在广州天河", @"请问你现在在哪里啊？我在广州天河", @"请问你现在在哪里啊？我在广州天河", @"请问你现在在哪里啊？我在广州天河", @"点击我查看最新消息，里面有惊喜哦！", @"点击我查看最新消息，里面有惊喜哦！", nil];
    self.dataSource = dataSource;
    
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(popMenu:)];
    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        
    }
    if (indexPath.row < self.dataSource.count) {
        cell.textLabel.text = (indexPath.row % 2) ? @"曾宪华" : @"杨仁捷";
        cell.detailTextLabel.text = self.dataSource[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"avator"];
    }
    
    cell.imageView.badgeViewFrame = CGRectMake(40, 0, 10, 10);
    cell.imageView.badgeView.textColor = [UIColor whiteColor];
    cell.imageView.badgeView.badgeColor = [UIColor redColor];
    cell.imageView.badgeView.text = @" ";
    
    
    if (indexPath.row == 4) {
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.097 green:0.633 blue:1.000 alpha:1.000];
    } else {
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    
    return cell;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!indexPath.row) {
        [self enterNewsController];
    } else {
        [self enterMessage];
    }
}

#pragma mark ---

- (void)groupChat{

}
- (void)addFriends{

}
- (void)scanQRCode{

}
- (void)takePhotosShare{

}
- (void)voipChat{

}

@end
