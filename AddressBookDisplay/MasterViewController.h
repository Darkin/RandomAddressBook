//
//  MasterViewController.h
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomUserCollector.h"
#import "RandomUserConverter.h"
#import "NSOperationQueueSingleton.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <RandomUserCollectorProtocol>{
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) RandomUserCollector *randomUserCollector;


@end

