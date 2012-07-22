//
//  MKBlockActionSheet.m
//  Linetime
//
//  Created by Max Kramer on 08/07/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import "MKBlockActionSheet.h"

@implementation MKBlockActionSheet
@synthesize actionBlock;

- (id) initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)firstTitle, ... {
    
    if ((self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil])) {
        
        NSString *title;
        
        va_list args;
        
        va_start(args, firstTitle);
        
        [self addButtonWithTitle:firstTitle];
        
        while ((title = va_arg(args, NSString *))) {
            
            [self addButtonWithTitle:title];
            
        }
        
        va_end(args);
        
        NSInteger cancelButtonIndex = [self addButtonWithTitle:cancelButtonTitle];
        
        [self setCancelButtonIndex:cancelButtonIndex];
        
    }
    
    return self;
    
}

- (void) setActionBlock:(MKActionBlock)_actionBlock {
    if (actionBlock != _actionBlock) {
        Block_release(actionBlock);
        actionBlock = Block_copy(_actionBlock);
    }
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        
    if (self.actionBlock != nil) {
                
        self.actionBlock(buttonIndex);
        
    }
    
}

@end
