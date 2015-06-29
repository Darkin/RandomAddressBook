//
//  NSOperationQueueSingleton.m
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-29.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import "NSOperationQueueSingleton.h"

@implementation NSOperationQueueSingleton

+ (id)sharedManager {
    static NSOperationQueueSingleton *operationSingletonQueue = nil;
    @synchronized(self) {
        if (operationSingletonQueue == nil){
            operationSingletonQueue = [[self alloc] init];
        }
    }
    return operationSingletonQueue;
}

-(id)init{
    if (self = [super init]) {
        self.maxConcurrentOperationCount = 5;
    }
    return self;
}

@end
