//
//  MenuViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatViewController.h"
#import "LoginViewController.h"
#import "MenuViewController.h"
#import "AnimationViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *chatButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *animationButton;
@end

@implementation MenuViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 *
 * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
 *
 * 2) Use Autolayout to make sure all UI works for each resolution
 *
 * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
 *    provided code if necessary. It is ok to add any classes. This is your project now!
 *
 * 4) Read the additional instructions comments throughout the codebase, they will guide you.
 *
 * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
 *
 * Thank you and Good luck. - App Partner
 * =========================================================================================
 */


- (void)viewDidLoad
{
    // TODO: Make the UI look like it does in the mock-up
    
    [super viewDidLoad];
    
    self.title = @"Coding Tasks";
}


- (IBAction)didPressChatButton:(id)sender
{
    ChatViewController *chatViewController = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)didPressLoginButton:(id)sender
{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginViewController animated:YES];
}

- (IBAction)didPressAnimationButton:(id)sender
{
    AnimationViewController *animationViewController = [[AnimationViewController alloc] init];
    [self.navigationController pushViewController:animationViewController animated:YES];
}

@end
