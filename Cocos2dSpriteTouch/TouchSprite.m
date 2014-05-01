//
//  TouchSprite.m
//  Cocos2dSpriteTouch
//
//  Created by 篠原正樹 on 2014/04/29.
//  Copyright 2014年 masakishinohara. All rights reserved.
//

#import "TouchSprite.h"


@implementation TouchSprite

-(void)onEnter{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                    priority:0
                                                    swallowsTouches:YES];
    [super onEnter];
}


-(void)onExit{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    BOOL isBlock = NO;
    
    CGPoint touchLocation = [touch locationInView:touch.view];
    CGPoint location = [[CCDirector sharedDirector] convertToGL:touchLocation];
    
    if(CGRectContainsPoint(self.boundingBox, location)){
        CCLOG(@"touch");
        
        isBlock = YES;
    }

    return isBlock;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CCLOG(@"move");
}


-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CCLOG(@"end");
}

@end
