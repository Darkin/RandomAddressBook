//
//  DetailViewController.m
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //I should probably leave the detail items as (id)s until they get in the RandomUserConverter instead of turn it into a dictionary as I should not care what I am sending it
        self.userDetails.text = [RandomUserConverter  getFullNameFromUserDictionary:(NSDictionary*)self.detailItem];
        self.userContent.text = [RandomUserConverter getAddressFromUserDictionary:(NSDictionary*)self.detailItem];
        self.title = [RandomUserConverter  getFullNameFromUserDictionary:(NSDictionary*)self.detailItem];
        [RandomUserConverter getLargeImageFromUserDictionary:(NSDictionary*)self.detailItem withOperationQueue:[NSOperationQueueSingleton sharedManager] withCompletion:^(BOOL complete, UIImage *image) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                //need to ensure all screen updates are done on the main queue
                self.largeImage.image = image;
            }];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
