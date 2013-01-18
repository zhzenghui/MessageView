//
//  MessageCell.h
//  messageView
//
//  Created by zeng on 13-1-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//



typedef enum MessageType {
    MessageTypeText = 0,
    MessageTypeImage = 1,
    MessageTypeVoice = 2,
} MessageType;

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
{
    UIImageView *bubbleImage;
}

@property(nonatomic, assign) MessageType messageType;

@property(nonatomic, retain) NSMutableDictionary *messageDict;
@property(nonatomic, retain) UILabel *contentLabel;
@end
