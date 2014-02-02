AHRelativeControls
==================

Drop in platformer controls for Cocos2D


Touch screen devices don't have physical buttons, and they should not be treated as if they do. When creating Mario-style platformers on touch screen devices, they're a lot of fun to play, but the controls haven't been changed much. They're generally based off of buttons that only exist in a small part of the screen. 

AHRelativeControls are controls only based on relative touches. To go left, the user presses left of the previous touch. To go right, the user touches right of the previous touch. This way, we retain the feel of the old platfomers but optimize the controls so they don't get in your way. 

You can feel when you leave a physical button; on a touch screen, everything feels the same. 


###Usage
=========
Initialize the AHRelControl
