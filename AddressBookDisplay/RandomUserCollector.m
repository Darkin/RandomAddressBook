//
//  RandomUserCollector.m
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import "RandomUserCollector.h"

@implementation RandomUserCollector

-(id) init{
    NSURL *url = [NSURL URLWithString:@"http://api.randomuser.me/?results=40"];
    return [self initWithURL:url];
}


- (id) initWithURL:(NSURL *)theURL{
    if (self = [super init])
    {
        self.url = theURL;
        self.statusCode = 0;
        self.timeout = 60;
    }
    return self;
}

-(void) startDownload{
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:self.url
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:_timeout];
    

    //normally would use delegates for connection but since have no real control (and don't care about results) a block will work fine
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueueSingleton sharedInstance] completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         
         NSDictionary *dataDictionary = nil;
         dataDictionary = [NSJSONSerialization JSONObjectWithData: data options: 0 error: nil];
         if (connectionError == nil) {
             //if the connection was successful
             if (self.delegate != nil) {
                 NSArray *tempArray = [dataDictionary objectForKey:@"results"];
                 NSMutableArray *populatedHouseArray = [[NSMutableArray alloc]init];
                 for(int i=0;i<[tempArray count];i++){
                     NSDictionary *tempDictionary = [tempArray objectAtIndex:i];
                     [populatedHouseArray addObject:tempDictionary];
                 }
                 //delegate is weaklinked so should not create problems with referenced in block
                 [self.delegate RandomUserCollectorDownloadedwithArray:populatedHouseArray];
             }
         }else{
             //the connection failed somehow
             if (self.delegate != nil) {
                 [self.delegate RandomUserCollectionDownloadFailed];
             }
         }
         
    }];
    
}

@end
