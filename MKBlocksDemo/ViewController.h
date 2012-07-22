//
//  ViewController.h
//  MKBlocksDemo
//
//  Created by Max Kramer on 22/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    IBOutletCollection(UIButton) NSArray *buttons;
    IBOutletCollection(UILabel) NSArray *labels;
}

@end
