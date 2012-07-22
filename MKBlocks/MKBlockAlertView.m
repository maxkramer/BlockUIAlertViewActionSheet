//
//  MKBlockAlertView.m
//  Linetime
//
//  Created by Max Kramer on 09/07/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import "MKBlockAlertView.h"

@implementation MKBlockAlertView
@synthesize actionBlock;

- (id) initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)firstTitle, ... {
    
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
        
        va_list args;
        
        va_start(args, firstTitle);
        
        NSString *title;
        
        [self addButtonWithTitle:firstTitle];
        
        while ((title = va_arg(args, NSString *))) {
            
            [self addButtonWithTitle:title];
            
        }
     
        va_end(args);
        
    }
    
    return self;
    
}

- (void) setActionBlock:(MKActionBlock)_actionBlock {
    if (actionBlock != _actionBlock) {
        Block_release(actionBlock);
        actionBlock = Block_copy(_actionBlock);
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.actionBlock != nil) {
        
        self.actionBlock(buttonIndex);
        
    }
    
}

@end
