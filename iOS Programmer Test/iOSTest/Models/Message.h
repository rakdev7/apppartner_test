//
//  Message.h
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Message : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *text;

@property (nonatomic,strong) NSData * imageData;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithTestName:(NSString *)name withTestMessage:(NSString *)message;
@end
