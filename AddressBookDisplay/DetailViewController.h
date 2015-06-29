//
//  DetailViewController.h
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomUserConverter.h"
#import "NSOperationQueueSingleton.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@property (weak, nonatomic) IBOutlet UILabel *userDetails;
@property (weak, nonatomic) IBOutlet UITextView *userContent;

@end

