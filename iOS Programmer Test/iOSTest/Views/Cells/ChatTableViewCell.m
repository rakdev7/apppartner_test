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
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

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
    
    self.cellImageView.layer.cornerRadius = self.cellImageView.frame.size.width / 2;
    self.cellImageView.clipsToBounds = YES;

    
    
}

- (void)setCellData:(Message *)message
{
    [self.header setText:message.username];
    [self.body setText:message.text];
    [self.cellImageView setImage:[UIImage imageWithData:message.imageData]];
    
//    NSData * imageData = [[NSData alloc] initWithContentsOfURL:message.avatarURL];
////
//    [self.cellImageView setImage:[UIImage imageWithData:imageData]];
   
}

@end
