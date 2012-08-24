iReactions for iPhone
=====================================
*iReactions for iPhone - Test your reactions FREE*

The subclasses are incredibly easy to implement, and require you to conform to the block:

`typedef void(^MKActionBlock)(NSInteger buttonIndex);`


Which can be done as used in the demo (MKBlockActionSheet), shown below. 

The `NSInteger buttonIndex` variable returns the index of the tapped button in either the `UIAlertView` or `UIActionSheet`.

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
    
    
If you have any issues with this project, feel free to open an issue or pull request if you have a fix for the issue.

Apart from that, feel free to follow me on Twitter: http://twitter.com/_max_k !


![image](http://maxk.me/images/mkblocks-1.png)     ![image](http://maxk.me/images/mkblocks-2.png)


