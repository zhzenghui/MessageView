//
//  CPMasterViewController.h
//  messageView
//
//  Created by zeng on 13-1-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPDetailViewController;

@interface CPMasterViewController : UITableViewController
{
    NSMutableArray *messageCellHeightArray;
}

@property (strong, nonatomic) CPDetailViewController *detailViewController;

@property(nonatomic, retain) NSMutableArray *messageArray;

- (IBAction)insert:(id)sender;
@end
