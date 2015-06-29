//
//  RandomUserConverter.h
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^myCompletion)(BOOL complete, UIImage* image);

@interface RandomUserConverter : NSObject

+(NSString*) getAddressFromUserDictionary:(NSDictionary*)dictionary;
+(NSString*) getFullNameFromUserDictionary:(NSDictionary*)dictionary;
+(NSString*) getPhoneFromUserDictionary:(NSDictionary*)dictionary;
+(NSString*) getEmailFromUserDictionary:(NSDictionary*)dictionary;
+(void) getLargeImageFromUserDictionary:(NSDictionary*)dictionary withOperationQueue:(NSOperationQueue*)queue withCompletion:(myCompletion)compBlock;

@end
