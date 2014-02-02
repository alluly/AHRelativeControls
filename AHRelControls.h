//
//  AHRelControls.h
//  Super Steve
//
//  Created by Ali Hasan on 8/26/13.
//  Copyright 2013 Ali Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AHRelControlsDelegate.h"

@interface AHRelControls : CCLayer {
    
    CGPoint lastTouch;
    
    BOOL btnJumpPressed;
    BOOL goingLeft;
    BOOL okayToMoveRight;
    BOOL okayToMoveLeft;

    unsigned int setter;
    float leftBound;
    float rightBound;
}

-(id)initWithCertainLeftBound:(float)leftBound rightBound:(float)rightBound;

@property(nonatomic, assign) id<AHRelControlsDelegate> delegate;

@end
