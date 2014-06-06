//
//  XHChatPopMenuView.h
//  MessageDisplayExample
//
//  Created by SunStone on 14-6-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XHChatPopMenuDelegate <NSObject>

@optional

- (void)groupChat;
- (void)addFriends;
- (void)scanQRCode;
- (void)takePhotosShare;
- (void)voipChat;

@end

@interface XHChatPopMenuView : UIView

@property (nonatomic, retain) id<XHChatPopMenuDelegate> delegate;


- (void)popInView:(UIView *)superView;
- (void)dismiss;

@end
