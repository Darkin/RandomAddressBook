//
//  NSOperationQueueSingleton.m
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-29.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import "NSOperationQueueSingleton.h"

@implementation NSOperationQueueSingleton

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}


-(id)init{
    if (self = [super init]) {
        self.maxConcurrentOperationCount = 5;
    }
    return self;
}

@end
