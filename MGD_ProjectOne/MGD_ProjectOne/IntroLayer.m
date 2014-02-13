//
//  IntroLayer.m
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/6/14.
//  Copyright Janelle Salisbury 2014. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
 

	if( (self=[super init])) {
        CCMenuItemImage *playGame = [CCMenuItemImage itemFromNormalImage:@"pig_64x72.png" selectedImage:@"turtle_64x72.png" target:self selector:@selector(onEnter:)];
        
        CCMenu *menuItem = [CCMenu menuWithItems:playGame, nil];
        
        [self addChild:menuItem];
        

    }
    return self;
     
}

-(void) onEnter:(id)sender
{
    //plays snake sound effect
    [[SimpleAudioEngine sharedEngine] playEffect:@"attack.wav"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1.0 scene: [HelloWorldLayer node]]];
}
@end
