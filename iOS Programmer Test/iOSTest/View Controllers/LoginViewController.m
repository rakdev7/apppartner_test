//
//  LoginViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"
#import "LoginClient.h"

@interface LoginViewController ()
@property (nonatomic, strong) LoginClient *client;
@end

@implementation LoginViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Take username and password input from the user using UITextFields
 *
 * 3) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *    Parameter One: username
 *    Parameter Two: password
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 *
 * 5) Calculate how long the API call took in milliseconds
 *
 * 6) If the response is an error display the error in a UIAlertView
 *
 * 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
 *
 * 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
**/


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
//    self.navigationController.navigationBar.topItem.title = @"Back";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] init];
    
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}



- (IBAction)didPressLoginButton:(id)sender
{
        LoginClient *client = [[LoginClient alloc]init];
    [client loginWithUsername:self.usernameTextField.text password:self.passwordTextField.text completion:^(NSMutableDictionary *responseDict) {
        
        NSLog(@"%@",responseDict);
        
      
        if ( [[responseDict valueForKey:@"code"]  isEqual: @"Error"]) {
            UIAlertController * alert1=   [UIAlertController
                                          alertControllerWithTitle:[responseDict valueForKey:@"code"]
                                          message:[responseDict valueForKey:@"message"]
                                          preferredStyle:UIAlertControllerStyleAlert];
        
            UIAlertAction* ok1 = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                 
                                 }];
            [alert1 addAction:ok1];
            
            
            
            [self presentViewController:alert1 animated:YES completion:nil];

        }
        else{
       // NSString *string = @"10.05";
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:[responseDict valueForKey:@"code"]
                                      message: [NSString stringWithFormat:@"%@ in %@ seconds",[responseDict valueForKey:@"message"],[responseDict valueForKey:@"loginTime"]]
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self.navigationController popToRootViewControllerAnimated:YES];
                             }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        }
   
    }];
    
    
}

@end
