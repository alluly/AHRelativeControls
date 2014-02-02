//
//  AHRelControlsDelegate.h
//  Super Steve
//
//  Created by Ali Hasan on 8/26/13.
//  Copyright (c) 2013 Ali Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AHRelControlsDelegate <NSObject>
@optional

-(void)moveLeft:(CGPoint)point;
-(void)moveRight:(CGPoint)point;

-(void)rightAux;
-(void)leftAux;

-(void)aButton:(CGPoint)point;
-(void)aButtonEnd;
-(void)bButton:(CGPoint)point;
-(void)bButtonEnd;

-(void)movementStop;

@end
