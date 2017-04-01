//
//  ChatClient.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatClient.h"

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation ChatClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: 
 **/

- (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock
{
    self.messages = [[NSMutableArray alloc]init];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    
    NSString *urlString = [NSString stringWithFormat: @"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/chat_log.php"];
    
    NSURL *url = [NSURL URLWithString: urlString];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            
            NSDictionary *responseBody = [NSJSONSerialization JSONObjectWithData: data options: 0 error: nil];
            
            NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
            for (id eachMessage in dataArray) {
                NSMutableDictionary *tempDict = eachMessage;
                [self.messages addObject:[[Message alloc]initWithDictionary:tempDict]];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(self.messages);
                
                
            });
            
        } else {
            // In case of failure
            dispatch_async(dispatch_get_main_queue(), ^{
                errorBlock([error localizedDescription]);
            });
        }
    }];
    
    [task resume];
}

@end
