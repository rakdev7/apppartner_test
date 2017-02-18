//
//  LoginClient.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginClient.h"

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LoginClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'username' and 'password'
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 **/

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSDictionary *))completion
{
    NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",username, password];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu" , (unsigned long)[postData length]];
    NSURL *url = [NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    
    _session = [NSURLSession sharedSession];
    
    NSDate *request_Time= [NSDate date];
    
    NSURLSessionDataTask *postDataTask = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDate *response_Time= [NSDate date];
        NSTimeInterval executionTime = [response_Time  timeIntervalSinceDate:request_Time];
        NSLog(@"%f",executionTime);
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(object);

        });
    }];
    
    [postDataTask resume];


}

@end
