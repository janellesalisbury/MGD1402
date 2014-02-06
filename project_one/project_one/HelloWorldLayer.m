//
//  HelloWorldLayer.m
//  project_one
//
//  Created by Janelle Salisbury on 2/6/14.
//  Copyright Janelle Salisbury 2014. All rights reserved.
//



#import "HelloWorldLayer.h"
#import "AppDelegate.h"

CCSprite *turtle;
CCSprite *pig;
CCSprite *snake;

#pragma mark - HelloWorldLayer


@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
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


-(id) init
{
    
    if((self = [super init])){
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

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
