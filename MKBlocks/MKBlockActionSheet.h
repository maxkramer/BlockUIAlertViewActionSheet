//
//  MKBlockActionSheet.h
//  Linetime
//
//  Created by Max Kramer on 08/07/2012.
//  Copyright (c) 2012 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKBlockConstant.h"

@interface MKBlockActionSheet : UIActionSheet <UIActionSheetDelegate> {

}

@property (nonatomic, assign) MKActionBlock actionBlock;

@end
