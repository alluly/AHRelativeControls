//
//  AHRelControls.m
//  Super Steve
//
//  Created by Ali Hasan on 8/26/13.
//  Copyright 2013 Ali Hasan. All rights reserved.
//

#import "AHRelControls.h"
#define kMiddleBound 280

@implementation AHRelControls

-(id)initWithCertainLeftBound:(float)left rightBound:(float)right
{
    self = [super init];
    if (self) {
        self->leftBound = left;
        self->rightBound = right;
        
        self.touchEnabled = YES;
        self.contentSize = self.parent.contentSize;
    }
    return self;
}

-(void)moveLeft
{
    setter = 1;
}

-(void)moveRight
{
    setter = 2;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        CGPoint point = [touch locationInView:[touch view]];
        point = [[CCDirector sharedDirector] convertToGL:point];
        if (lastTouch.x < 280 && point.x < 280) {

            if (point.x < leftBound) {
                //move left, regardless
                [self.delegate moveLeft:point];
            }
            if (point.x < kMiddleBound && point.x > rightBound) {
                //move right, regardless
                [self.delegate moveRight:point];
            }
            if (point.x > leftBound && point.x < rightBound) {
                
                if (lastTouch.x - point.x > 0) {
                    //move left
                    [self.delegate moveLeft:point];
                }
                
                if (lastTouch.x - point.x < 0) {
                    goingLeft = NO;
                    //move right
                    [self.delegate moveRight:point];
                }
                
                if (lastTouch.x - point.x < 15 && setter == 1) {
                    if (lastTouch.x < kMiddleBound && point.x < kMiddleBound) {
                        //move left
                        [self.delegate moveLeft:point];
                    }
                }
                
                if (lastTouch.x - point.x > -15 && setter == 2) {
                    if (lastTouch.x < kMiddleBound && point.x < kMiddleBound) {
                        //move right
                        [self.delegate moveRight:point];
                    }
                }
            }
        } else if (point.x > kMiddleBound) {
            
            if (point.x < leftBound + kMiddleBound) {
                //a button, regardless
                [self.delegate aButton:point];
            }
            if (point.x < kMiddleBound && point.x > rightBound) {
                //b button, regardless
                [self.delegate bButton:point];
            }

            //jump
            [self.delegate aButton:point];
            
            okayToMoveLeft = NO;
            okayToMoveRight = YES;
            btnJumpPressed = YES;
        }
        else {
            btnJumpPressed = NO;
        }
    }
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

   	UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    CGPoint difference = ccpSub(touchLocation, lastTouch);
    
    if (touchLocation.x < kMiddleBound && lastTouch.x < kMiddleBound) {
        
        if (lastTouch.x - touchLocation.x <0 && okayToMoveRight) {
            // delegate, move right
            [self.delegate moveRight:touchLocation];
            if (difference.x < 0 && difference.y < 0) {
                [self.delegate rightAux];
            }
        }
        if (lastTouch.x - touchLocation.x>0 && okayToMoveLeft) {
            //delegate, move left
            [self.delegate moveLeft:touchLocation];
            if (difference.x < 0 && difference.y < 0) {
                [self.delegate leftAux];
            }
        }
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInView: [touch view]];
    loc = [[CCDirector sharedDirector] convertToGL: loc];
    
    if (loc.x < kMiddleBound) {
        lastTouch = loc;
    }
    
	NSSet *allTouches = [event allTouches];
    
    if (loc.x < kMiddleBound) {
        [self.delegate movementStop];
    }
    
    if ([allTouches count] == 1 && loc.x < kMiddleBound) {

	} else if ([allTouches count] == 1 && loc.x > kMiddleBound) {
        
        okayToMoveLeft = YES;
        okayToMoveRight = YES;
        [self.delegate movementStop];
        [self.delegate aButtonEnd];
        
    } else if ([allTouches count] == 2 && loc.x > 280) {
        
        okayToMoveLeft = YES;
        okayToMoveRight = YES;
        [self.delegate movementStop];
        [self.delegate aButtonEnd];
        
    } else if ([allTouches count] == 3) {
        
    }
  
}
@end
