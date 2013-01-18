//
//  CPMasterViewController.m
//  messageView
//
//  Created by zeng on 13-1-17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "CPMasterViewController.h"
#import "CPDetailViewController.h"

#import "MessageCell.h"


@implementation CPMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize messageArray ;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - 

- (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width  
{  
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:KmessageFontSise] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置  
    return sizeToFit.height;  
}

- (float)cellHeight :(NSDictionary *)dict
{
    float cellHeight =0;

    switch ([[dict objectForKey:KmessageType] intValue]) {
        case MessageTypeText:
        {
            cellHeight  =   [self heightForString:[dict objectForKey:KmessageText] fontSize:KmessageFontSise andWidth:KmessageWidth];
            if (cellHeight < 50) {
                cellHeight = 50;
            }
            //        [dict setValue:[NSNumber numberWithFloat:cellHeight] forKey:KmessageHeight];
            cellHeight +=15;
            
            break;
        }   
        case MessageTypeImage:
        {
            cellHeight = 104;
            break;
        }
        default:
            break;
    }
    cellHeight += 10;
    
    
    return cellHeight;

}
- (void)allCellHeight
{
    
    for (NSMutableDictionary *dict in messageArray) {
        [messageCellHeightArray addObject:[NSNumber numberWithFloat:  [self cellHeight:dict]]];
    }
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    }
    
    messageArray = [[NSMutableArray alloc] init];
    messageCellHeightArray = [[NSMutableArray alloc] init];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1adsfadsfdqwe12312asdfasdfsafdasd/nfasdfsadfasdfasdfsadfasd\
                          kljlkjlkjlkjlkjlkjlk\
                          jlkjlkjlkjlkjl\
                          jlkjlkjlkjlkjl\
                          jlkjlkjlkjlkjl\
                          jlkjlkjlkjlkjl\
                          jlkjlkjlkjlkjl\
                          nfasdf", @"messageText",
                          @"0", @"messageType",
                          @"2012", @"messageTime",
                          @"0", @"messageIsRead",
                          @"1", @"messageIsMe"
                          , nil];
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1adsfndsfdqwe12312", @"messageText",
                          @"0", @"messageType",
                          @"2012", @"messageTime",
                          @"0", @"messageIsRead",
                          @"0", @"messageIsMe"
                          , nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1123123asfasdf", @"messageText",
                          @"1", @"messageType",
                          @"2012", @"messageTime",
                          @"0", @"messageIsRead",
                           @"0", @"messageIsMe"
                          , nil]; 
    NSDictionary *dict5 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"1123123asfasdf", @"messageText",
                           @"1", @"messageType",
                           @"2012", @"messageTime",
                           @"0", @"messageIsRead",
                           @"1", @"messageIsMe"
                           , nil]; 
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1adsfadsfdqwe1nfasdf", @"messageText",
                          @"0", @"messageType",
                          @"2012", @"messageTime",
                          @"0", @"messageIsRead",
                          @"1", @"messageIsMe"
                          , nil];
    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"1adsfndsfdqwe12312asdkljhaslkdh我说可以了", @"messageText",
                           @"0", @"messageType",
                           @"2012", @"messageTime",
                           @"0", @"messageIsRead",
                           @"0", @"messageIsMe"
                           , nil];
    [messageArray addObject:dict];
    [messageArray addObject:dict1];    
    [messageArray addObject:dict2];  
    [messageArray addObject:dict5];    

    [messageArray addObject:dict3];    
    [messageArray addObject:dict4];    

    
    NSLog(@"%@", messageArray);

    [self allCellHeight];

}

int i =0;
- (IBAction)insert:(id)sender 
{
    if (i==0)
        i=1;
    else 
        i =0;
    
    UIImage *image = [UIImage imageNamed:@"p7603305"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"1adsfndsfdqwe12312asdkljhaslkdh我说可以了", @"messageText",
                           @"1", @"messageType",
                           @"2012", @"messageTime",
                           @"0", @"messageIsRead",
                           image, KmessageImage,
                           [NSNumber numberWithInt:i], @"messageIsMe"
                           , nil];
    [messageArray addObject:dict];
    [messageCellHeightArray addObject:[NSNumber numberWithFloat:  [self cellHeight:dict]]];
    [self.tableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:messageArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}



// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return messageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[messageCellHeightArray objectAtIndex:indexPath.row] floatValue];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        }
    }

    // Configure the cell.
//    cell.textLabel.text = NSLocalizedString(@"Detail", @"Detail");
//    cell.contentTextField.text = NSLocalizedString(@"Detail", @"Detail");
    cell.messageDict = [messageArray objectAtIndex:indexPath.row];
//    cell.contentTextField.text = [[messageArray objectAtIndex:indexPath.row] objectForKey:KmessageText];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
	        self.detailViewController = [[[CPDetailViewController alloc] initWithNibName:@"CPDetailViewController_iPhone" bundle:nil] autorelease];
	    }
//        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
}


@end
