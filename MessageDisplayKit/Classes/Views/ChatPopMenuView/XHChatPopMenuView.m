//
//  XHChatPopMenuView.m
//  MessageDisplayExample
//
//  Created by SunStone on 14-6-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHChatPopMenuView.h"
#import "XHChatPopMenuCell.h"

#define kXHChatPopMenuIcon      @"kXHChatPopMenuIcon"
#define kXHChatPopMenuTitle     @"kXhChatPopMenuTitle"

@interface XHChatPopMenuView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UIImageView   *contentImageView;
@property (nonatomic, retain) UITableView   *tableView;
@property (nonatomic, retain) NSMutableArray *dataSource;

@end

@implementation XHChatPopMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        /*
        contacts_add_friend@2x.png
        contacts_add_newmessage@2x.png
        contacts_add_photo@2x.png
        contacts_add_scan@2x.png
        contacts_add_voip@2x.png
         */
        //发起群聊
        NSDictionary *groupChatDic = [NSDictionary dictionaryWithObjectsAndKeys:@"contacts_add_newmessage.png", kXHChatPopMenuIcon, @"发起群聊", kXHChatPopMenuTitle,nil];
        //添加朋友
        NSDictionary *addFriendDic = [NSDictionary dictionaryWithObjectsAndKeys:@"contacts_add_friend.png", kXHChatPopMenuIcon, @"添加朋友", kXHChatPopMenuTitle,nil];
        //扫一扫
        NSDictionary *scanDic = [NSDictionary dictionaryWithObjectsAndKeys:@"contacts_add_scan.png", kXHChatPopMenuIcon, @"扫一扫", kXHChatPopMenuTitle,nil];
        //拍照分享
        NSDictionary *cameraShareDic = [NSDictionary dictionaryWithObjectsAndKeys:@"contacts_add_photo.png", kXHChatPopMenuIcon, @"拍照分享", kXHChatPopMenuTitle,nil];
        //视频聊天
        NSDictionary *voipDic = [NSDictionary dictionaryWithObjectsAndKeys:@"contacts_add_voip.png", kXHChatPopMenuIcon, @"视频聊天", kXHChatPopMenuTitle,nil];
        
        self.dataSource = [[NSMutableArray alloc] initWithObjects:groupChatDic,addFriendDic,scanDic,cameraShareDic,voipDic,nil];
        
        UIImage *image = [UIImage imageNamed:@"MoreFunctionFrame.png"];
        UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 30, 50)];
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(175, 63, 140, 230)];
        _contentImageView.image = resizeImage;
        _contentImageView.contentMode = UIViewContentModeScaleToFill;
        _contentImageView.userInteractionEnabled = YES;
        [self addSubview:_contentImageView];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 7, 140, 222) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = [UIColor clearColor];//[UIColor colorWithRed:55.0f/255 green:62.0f blue:66.0f alpha:1.0];
        [_contentImageView addSubview:self.tableView];
    }
    return self;
}


- (void)popInView:(UIView *)superView{
    [superView addSubview:self];
}

- (void)dismiss{
    [UIView animateWithDuration:0.25
                          delay:0.1
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                              self.alpha = 0;
                          } completion:^(BOOL finished) {
                              if (finished) {
                                  [self removeFromSuperview];
                              }
                          }];
}


#pragma mark ---tableView datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    XHChatPopMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[XHChatPopMenuCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        cell.backgroundColor = tableView.backgroundColor;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    NSString *title = [self.dataSource[indexPath.row] objectForKey:kXHChatPopMenuTitle];
    NSString *imageName = [self.dataSource[indexPath.row] objectForKey:kXHChatPopMenuIcon];
    cell.titleLabel.text = title;
    cell.iconImageView.image = [UIImage imageNamed:imageName];
    return cell;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

#pragma mark ---tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:     //群聊
            if ([self.delegate respondsToSelector:@selector(groupChat)]) {
                [self.delegate groupChat];
            }
            break;
        case 1:     //添加朋友
            if ([self.delegate respondsToSelector:@selector(addFriends)]) {
                [self.delegate addFriends];
            }
            break;
        case 2:    //扫一扫
            if ([self.delegate respondsToSelector:@selector(scanQRCode)]) {
                [self.delegate scanQRCode];
            }
            break;
        case 3:     //拍照分享
            if ([self.delegate respondsToSelector:@selector(takePhotosShare)]) {
                [self.delegate takePhotosShare];
            }
            break;
            
        case 4:     //视频聊天
            if ([self.delegate respondsToSelector:@selector(voipChat)]) {
                [self.delegate voipChat];
            }
            break;
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}


@end
