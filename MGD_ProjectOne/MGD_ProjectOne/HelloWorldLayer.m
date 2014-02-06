//
//  HelloWorldLayer.m
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/6/14.
//  Copyright Janelle Salisbury 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

CCSprite *background;
CCSprite *turtle;
CCSprite *pig;
CCSprite *snake;



@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        //add the background texture
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        background = [CCSprite spriteWithFile:@"background texture.jpg"];
        background.position = ccp(windowSize.width/2, windowSize.height/2);
        [self addChild:background];
        
        //add turtle sprite
        turtle = [CCSprite spriteWithFile:@"turtle_64x72.png"];
        turtle.position = ccp(175,120);
        [self addChild:turtle];
        
        //add pig sprite
        pig = [CCSprite spriteWithFile:@"pig_64x72.png"];
        pig.position = ccp(275,150);
        [self addChild:pig];
        
        //add snake sprite
        snake = [CCSprite spriteWithFile:@"snake.png"];
        snake.position = ccp(375,110);
        [self addChild:snake];
		
    }
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end
