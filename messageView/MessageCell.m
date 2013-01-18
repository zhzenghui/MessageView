//
//  MessageCell.m
//  messageView
//
//  Created by zeng on 13-1-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell
@synthesize contentLabel;
@synthesize messageType;
@synthesize messageDict = _messageDict;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGSize) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width  
{  
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:KmessageFontSise] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置  
    return sizeToFit;  
}

// 设置头像
- (void)faceImage:(NSMutableDictionary *)messageDict
{
    CGRect rectButton = CGRectMake(5, 2, 45, 45);
    if ([[messageDict objectForKey:KmessageIsMe] intValue]== 1) {
        rectButton = CGRectMake(KScreenWidth - 50, 2, 45, 45);
    }
    
    UIButton *button  = [[UIButton alloc] init];
    [button setBackgroundImage: [UIImage imageNamed:@"p7603305"] forState:UIButtonTypeCustom];
    button.frame = rectButton;
    [self addSubview:button];
    
    [button release];
}

- (void)setmessageTextBackground:(NSMutableDictionary *)messageDict
{
    if (!bubbleImage) {
        bubbleImage = [[UIImageView alloc] init];        
    }

    
    if ([[messageDict objectForKey:KmessageIsMe] intValue]== 1) {
        bubbleImage.image = [[UIImage imageNamed:@"chatto_bg_normal.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:24];
        bubbleImage.frame = CGRectMake(contentLabel.frame.origin.x -5 , 0, contentLabel.frame.size.width + 20, contentLabel.frame.size.height + 15);
    }
    else {
        bubbleImage.image = [[UIImage imageNamed:@"chatfrom_bg_normal.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:24];
        bubbleImage.frame = CGRectMake(contentLabel.frame.origin.x -10 , 0, contentLabel.frame.size.width + 20, contentLabel.frame.size.height + 15);
    }


    [self addSubview:bubbleImage];
}

- (void)setmessageImageBackground:(NSMutableDictionary *)messageDict
{
    if (!bubbleImage) {
        bubbleImage = [[UIImageView alloc] init];        
    }
    
//  284/2  670 /2
    if ([[messageDict objectForKey:KmessageIsMe] intValue]== 1) {
        bubbleImage.image = [[UIImage imageNamed:@"chatto_bg_normal.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:24];
        bubbleImage.frame = CGRectMake(145 , 0, 93 + 21, 93 + 14);
    }
    else {
        bubbleImage.image = [[UIImage imageNamed:@"chatfrom_bg_normal.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:24];
        bubbleImage.frame = CGRectMake(60 , 0, 93 + 21, 93 + 15);
    }
    [self addSubview:bubbleImage];

}

- (void)messageText:(NSMutableDictionary *)messageDict
{
    CGSize size = [self heightForString:[messageDict objectForKey:KmessageText] fontSize:KmessageFontSise andWidth:KmessageWidth];
    NSLog(@"%@", [messageDict objectForKey:KmessageText]);
    float cellHeight = size.height;
    float backgroundWidth=0;
    if (size.width  < KmessageWidth) {
        backgroundWidth = KmessageWidth - size.width;
    } 
    
    UILabel *cText = [[UILabel alloc] init];
    
    CGRect rect = CGRectMake(60, 4, KmessageWidth-backgroundWidth, cellHeight);
    if ([[messageDict objectForKey:KmessageIsMe] intValue]== 1) {

            
        rect = CGRectMake(KScreenWidth - 50 - 235+backgroundWidth, 4, KmessageWidth-backgroundWidth, cellHeight);
    }
    cText.backgroundColor = [UIColor clearColor];
    cText.frame = rect;
    cText.numberOfLines = 10;
    contentLabel = cText;
    [self setmessageTextBackground:messageDict];    
    [self addSubview:cText];
    [cText release];
    
    self.contentLabel.text = [messageDict objectForKey:KmessageText];
}


- (void)setMessageCellText:(NSMutableDictionary *)messageDict
{
//    face 
    [self faceImage:messageDict];
//    
    [self messageText:messageDict];
}

- (void)setMessageCellImage:(NSMutableDictionary *)messageDict
{
    
//    face 
    [self faceImage:messageDict];
//  
    CGRect rect = CGRectMake(73, 5, 93, 93);
    if ([[messageDict objectForKey:KmessageIsMe] intValue]== 1) {
        rect = CGRectMake(153, 5, 93, 93);
    }
    
    UIButton *iv  = [[UIButton alloc] init];
    [iv setImage:[messageDict objectForKey:KmessageImage] forState:UIControlStateNormal];
    iv.frame = rect;
    [self setmessageImageBackground:messageDict];
    [self addSubview:iv];
    
    [iv release];
}

- (void)setMessageDict:(NSMutableDictionary *)messageDict
{
//    [self subviews remove(<#const char *#>)];
    for (UIView *v in [self subviews]) {
        
        [v removeFromSuperview];
    }
    switch ([[messageDict objectForKey:KmessageType] intValue]) {
        case MessageTypeText:
        {
            [self setMessageCellText:messageDict];
            break;
        }
        case MessageTypeImage:
        {
            [self setMessageCellImage:messageDict];
            break;
        }
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
    [contentLabel release];
}
@end
