AHRelativeControls
==================

Drop in platformer controls for Cocos2D


Touch screen devices don't have physical buttons, and they should not be treated as if they do. When creating Mario-style platformers on touch screen devices, they're a lot of fun to play, but the controls haven't been changed much. They're generally based off of buttons that only exist in a small part of the screen. 

AHRelativeControls are controls only based on relative touches. To go left, the user presses left of the previous touch. To go right, the user touches right of the previous touch. This way, we retain the feel of the old platfomers but optimize the controls so they don't get in your way. 

You can feel when you leave a physical button; on a touch screen, everything feels the same. 

###What is it?
AHRelControls is basically a CCLayer that goes on top of your game later. Add it as a child and use the delegate methods to work with your character.

###Usage
=========
Import three files `AHRelControls.h AhRelControls.m AHRelControlsDelegate.h`

Initalize the controls by specifying the boundaries by which the character should always move left, right. 

`AHRelControls *controls = [[AHRelControls alloc] initWithCertainLeftBound:25 rightBound:230];
 controls.position = CGPointZero;
 controls.delegate = self; 
 [self addChild:controls z:10];`
 
 Add the delegate methods:
 `#pragma mark Controls Delegate

-(void)moveRight:(CGPoint)point
{
    CCLOG(@"right");
}

-(void)moveLeft:(CGPoint)point
{
    CCLOG(@"left");
}
`
Right and Left are the only required ones, everything else is optional.

###Todo

The controls are really basic at the moment. One of the best things to add would be an onboarding sequence that demonstrates how the controls work. Some users find confusion with the controls; a good tutorial should alleviate this. 
The algorithm for determining slides, relative touches, relative a/b touches could use some polishing. If anyone would like to contribute, that would be great!
