//
//  RandomUserConverter.m
//  AddressBookDisplay
//
//  Created by Darren Larkin on 2015-06-28.
//  Copyright (c) 2015 D2tech Software. All rights reserved.
//

#import "RandomUserConverter.h"

#define kUser @"user"
#define kGender @"gender"
#define kContectEmail @"email"
#define kContectCell @"cell"
#define kNationality @"nationality"

#define kName @"name"
#define kNameFirst @"first"
#define kNameLast @"last"
#define kNameTitle @"title"

#define kPictures @"picture"
#define kPictureLarge @"large"
#define kPictureMedium @"medium"
#define kPictureSmall @"thumbnail"

#define kAddress @"location"
#define kAddressCity @"city"
#define kAddressState @"state"
#define kAddressStreet @"street"
#define kAddressZip @"zip"



@implementation RandomUserConverter

+(NSString*) getAddressFromUserDictionary:(NSDictionary*)dictionary{
    NSMutableString *tempString = [[NSMutableString alloc] init];
    NSDictionary *userDictionary = [dictionary objectForKey:kUser];
    NSDictionary *tempDictionary = [userDictionary objectForKey:kAddress];
    if (tempDictionary != nil){
        if ([tempDictionary objectForKey:kAddressStreet]) {
            [tempString appendString:[tempDictionary objectForKey:kAddressStreet]];
            [tempString appendString:@", "];
        }
        if ([tempDictionary objectForKey:kAddressCity]) {
            [tempString appendString:[tempDictionary objectForKey:kAddressCity]];
            [tempString appendString:@", "];
        }
        if ([tempDictionary objectForKey:kAddressState]) {
            [tempString appendString:[tempDictionary objectForKey:kAddressState]];
            [tempString appendString:@", "];
        }
        if ([tempDictionary objectForKey:kAddressZip]) {
            [tempString appendString:[tempDictionary objectForKey:kAddressZip]];
        }
        if ([tempString isEqualToString:@""]) {
            return @"none";
        }
        return tempString;
    }
    return @"none";
}

+(NSString*) getFullNameFromUserDictionary:(NSDictionary*)dictionary{
    NSMutableString *tempString = [[NSMutableString alloc] init];
    NSDictionary *userDictionary = [dictionary objectForKey:kUser];
    NSDictionary *tempDictionary = [userDictionary objectForKey:kName];
    if (tempDictionary != nil){
        if ([tempDictionary objectForKey:kNameTitle]) {
            [tempString appendString:[tempDictionary objectForKey:kNameTitle]];
            [tempString appendString:@". "];
        }
        if ([tempDictionary objectForKey:kNameFirst]) {
            [tempString appendString:[tempDictionary objectForKey:kNameFirst]];
            [tempString appendString:@" "];
        }
        if ([tempDictionary objectForKey:kNameLast]) {
            [tempString appendString:[tempDictionary objectForKey:kNameLast]];
        }
        if ([tempString isEqualToString:@""]) {
            return @"none";
        }
        return tempString;
    }
    return @"none";
}

+(NSString*) getPhoneFromUserDictionary:(NSDictionary*)dictionary{
    NSDictionary *userDictionary = [dictionary objectForKey:kUser];
    NSDictionary *tempDictionary = [userDictionary objectForKey:kName];
    return [tempDictionary objectForKey:kContectCell];
}

+(NSString*) getEmailFromUserDictionary:(NSDictionary*)dictionary{
    NSDictionary *userDictionary = [dictionary objectForKey:kUser];
    NSDictionary *tempDictionary = [userDictionary objectForKey:kName];
    return [tempDictionary objectForKey:kContectEmail];
}

+(void) getLargeImageFromUserDictionary:(NSDictionary*)dictionary withOperationQueue:(NSOperationQueue*)queue withCompletion:(myCompletion)compBlock{
    NSDictionary *userDictionary = [dictionary objectForKey:kUser];
    NSDictionary *tempDictionary = [userDictionary objectForKey:kPictures];
    NSString *imageURLString = [tempDictionary objectForKey:kPictureLarge];
    NSURL *tempURL = [NSURL URLWithString:imageURLString];
    
    __block UIImage* tempImage;
    
    
    if (queue == nil) {
        queue = [[NSOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 5;
    }
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:tempURL
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:queue completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         tempImage = [UIImage imageWithData:data];
         if (compBlock != nil) {
             compBlock(YES, tempImage);
         }
     }];
}




@end
