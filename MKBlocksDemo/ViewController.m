//
//  ViewController.m
//  MKBlocksDemo
//
//  Created by Max Kramer on 22/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "MKBlockActionSheet.h"
#import "MKBlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIButton *button in buttons) {
        
        int index = [buttons indexOfObject:button];
        
        switch (index) {
                
            case 0:
                [button addTarget:self action:@selector(showAlertView) forControlEvents:UIControlEventTouchUpInside];
                break;
                
            case 1:
                [button addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
                break;
                
            case 2:
                [button addTarget:self action:@selector(showTwitter) forControlEvents:UIControlEventTouchUpInside];
                break;

            case 3:
                [button addTarget:self action:@selector(showEmail) forControlEvents:UIControlEventTouchUpInside];
                break;
                
        }
        
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) showAlertView {
    
    MKBlockAlertView *alertView = [[MKBlockAlertView alloc] initWithTitle:@"Male or Female?" message:@"Are you Male or Female?" delegate:nil cancelButtonTitle:@"Neither" otherButtonTitles:@"Male", @"Female", nil];
    
    [alertView setActionBlock:^(NSInteger buttonIndex) {
        
        if (buttonIndex == alertView.cancelButtonIndex) {
                        
            [[labels objectAtIndex:0] setText:@"You are ... neither ... male nor female!"];
            
        }
        
        else if (buttonIndex == 1) {
            
            [[labels objectAtIndex:0] setText:@"You are Male!"];
            
        }
        
        else if (buttonIndex == 2) {
            
            [[labels objectAtIndex:0] setText:@"You are Female!"];
            
        }
        
    }];
    
    [alertView show];
    [alertView release];
    
}

- (void) showActionSheet {
    
    MKBlockActionSheet *actionSheet = [[MKBlockActionSheet alloc] initWithTitle:@"Male or Female?" delegate:nil cancelButtonTitle:@"Neither" destructiveButtonTitle:nil otherButtonTitles:@"Male", @"Female", nil];
    
    [actionSheet setActionBlock:^(NSInteger buttonIndex) {
       
        if (buttonIndex == actionSheet.cancelButtonIndex) {
            
            [[labels objectAtIndex:1] setText:@"You are ... neither ... male nor female!"];
            
        }
        
        else if (buttonIndex == 1) {
            
            [[labels objectAtIndex:1] setText:@"You are Male!"];
            
        }
        
        else if (buttonIndex == 2) {
            
            [[labels objectAtIndex:1] setText:@"You are Female!"];
            
        }
        
    }];
    
    [actionSheet showInView:self.view];
    
    [actionSheet release];
    
}

- (void) showTwitter {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/_max_k"]];
    
}

- (void) showEmail {
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    
    [controller setSubject:@"MKBlocks Support"];
    
    [controller setMailComposeDelegate:(id<MFMailComposeViewControllerDelegate>) self];
    
    [controller setToRecipients:[NSArray arrayWithObject:@"max@maxk.me"]];
    
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
