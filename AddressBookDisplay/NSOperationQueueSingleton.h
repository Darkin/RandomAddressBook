//
//  NSOperationQueueSingleton.h
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-29.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueueSingleton : NSOperationQueue

+ (instancetype)sharedInstance;

@end
