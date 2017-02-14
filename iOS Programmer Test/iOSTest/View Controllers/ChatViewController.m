//
//  ChatViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatViewController.h"
#import "MenuViewController.h"
#import "ChatTableViewCell.h"
#import "ChatClient.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *chatTable;
@property (nonatomic, strong) ChatClient *client;
@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation ChatViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Using the following endpoint, fetch chat data
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/chat_log.php
 *
 * 3) Parse the chat data using 'Message' model
 *
 **/


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messages = [[NSMutableArray alloc] init];
    [self configureTable:self.chatTable];
    self.title = @"Chat";
    
    
    // TODO: Remove test data when we have actual data from the server loaded
    [self.messages addObject:[[Message alloc] initWithTestName:@"James" withTestMessage:@"Hey Guys!"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Paul" withTestMessage:@"What's up?"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Amy" withTestMessage:@"Hey! :)"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"James" withTestMessage:@"Want to grab some food later?"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Paul" withTestMessage:@"Sure, time and place?"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Amy" withTestMessage:@"YAS! I am starving!!!"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"James" withTestMessage:@"1 hr at the Local Burger sound good?"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Paul" withTestMessage:@"Sure thing"]];
    [self.messages addObject:[[Message alloc] initWithTestName:@"Amy" withTestMessage:@"See you there :P"]];
    [self.chatTable reloadData];
}

- (void)configureTable:(UITableView *)tableView
{
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChatTableViewCell"];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell *cell = nil;
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ChatTableViewCell" owner:self options:nil];
        cell = (ChatTableViewCell *)[nib objectAtIndex:0];
    }
    [cell setCellData:self.messages[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}


#pragma mark - IBAction

- (IBAction)backAction:(id)sender
{
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

@end
