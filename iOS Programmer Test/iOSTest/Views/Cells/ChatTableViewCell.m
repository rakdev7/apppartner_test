//
//  ChatTableViewCell.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatTableViewCell.h"

@interface ChatTableViewCell ()

@property (nonatomic, strong) Message *message;
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UILabel *body;

@end

@implementation ChatTableViewCell

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Setup cell to match mockup
 * 
 * 2) Include user's avatar image
 **/


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setCellData:(Message *)message
{
    [self.header setText:message.username];
    [self.body setText:message.text];
}

@end
