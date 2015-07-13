//
//  RandomUserCollector.h
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSOperationQueueSingleton.h"

@protocol RandomUserCollectorProtocol <NSObject>
@optional
/**
 * delegate call that lets you know that the data request failed
 * @author Darren Larkin
 *
 * @return none
 */
- (void) RandomUserCollectionDownloadFailed;
@required
/**
 * delegate call that gives the random user information
 * @author Darren Larkin
 *
 * @param array The array of downloaded random user information
 * @return none
 */
- (void) RandomUserCollectorDownloadedwithArray:(NSArray*)array;
@end


@interface RandomUserCollector : NSObject{
    
}

@property (nonatomic, strong) NSURL* url;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, assign) NSTimeInterval timeout;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, readonly) NSError* error;
@property (weak) id <RandomUserCollectorProtocol> delegate;

- (id) initWithURL:(NSURL *)theURL;
- (void) startDownload;


@end
