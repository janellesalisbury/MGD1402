//
//  HelloWorldLayer.m
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/6/14.
//  Copyright Janelle Salisbury 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
#import "CocosDenshion.h"
#import "CDAudioManager.h"
#import "PauseSceneLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

@interface HelloWorldLayer()
{
    BOOL fishSwimming;
}

@property (strong, nonatomic) CCSprite *fish;
@property (strong, nonatomic) CCAction *swimAction;


@end

CCSprite *background;
CCSprite *turtle;
CCSprite *pig;
CCSprite *snake;





@implementation HelloWorldLayer


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    //HUD Layer
    HUDLayer *hud = [HUDLayer node];
    [scene addChild:hud z:1];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [[HelloWorldLayer alloc] initWithHUD:hud];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

/*
- (void)restartTapped:(id)sender {
    
    // Reload the current scene
    CCScene *scene = [HelloWorldLayer scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:0.5 scene:scene]];
    
}

- (void)showRestartMenu:(BOOL)won {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    NSString *message;
    if (won) {
        message = @"You win!";
    } else {
        message = @"You lose!";
    }
    
    CCLabelBMFont *label;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        label = [CCLabelBMFont labelWithString:message fntFile:@"Arial-hd.fnt"];
    } else {
        label = [CCLabelBMFont labelWithString:message fntFile:@"Arial.fnt"];
    }
    label.scale = 0.1;
    label.position = ccp(winSize.width/2, winSize.height * 0.6);
    [self addChild:label];
    
    CCLabelBMFont *restartLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        restartLabel = [CCLabelBMFont labelWithString:@"Restart" fntFile:@"Arial-hd.fnt"];
    } else {
        restartLabel = [CCLabelBMFont labelWithString:@"Restart" fntFile:@"Arial.fnt"];
    }
    
    CCMenuItemLabel *restartItem = [CCMenuItemLabel itemWithLabel:restartLabel target:self selector:@selector(restartTapped:)];
    restartItem.scale = 0.1;
    restartItem.position = ccp(winSize.width/2, winSize.height * 0.4);
    
    CCMenu *menu = [CCMenu menuWithItems:restartItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:10];
    
    [restartItem runAction:[CCScaleTo actionWithDuration:0.5 scale:1.0]];
    [label runAction:[CCScaleTo actionWithDuration:0.5 scale:1.0]];
    
}
*/
// on "init" you need to initialize your instance.

//WHEN I USE INITWITHHUD TO USE MY HUD LAYER THE GAME SCREEN WILL ONLY SHOW UP AS A BLACK SCREEN FOR SOME REASON
-(id) init
{
    
    //animation
    //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"fishanimation.plist"];
     
    //CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"fish.png"];
    
     
     
     
     
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        self.isTouchEnabled = YES;
   
        //play background sound effect(obtained for free on freesound.org)
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"wildlife.wav"];
        
        //all images obtained for free from opengameart
        //add the background texture
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        background = [CCSprite spriteWithFile:@"background texture.jpg"];
        background.position = ccp(windowSize.width/2, windowSize.height/2);
        [self addChild:background];
        
        //add turtle sprite
        turtle = [CCSprite spriteWithFile:@"turtle_64x72.png"];
        turtle.position = ccp(30,120);
        [self addChild:turtle];
        //spin the turtle(borrowed from www.youtube.com/watch?v=Z-Hb-XJVSOI
        CCRotateBy *spinTurtle = [CCRotateBy actionWithDuration:5.0 angle:175];
        [turtle runAction:spinTurtle];
        
        //add pig sprite
        pig = [CCSprite spriteWithFile:@"pig_64x72.png"];
        pig.position = ccp(275,150);
        
        
         /*
         TRIED TO ADD A SOUND WHEN THE PIG IS CLICKED HERE BUT IT DOESNT WORK, IT ACTUALLY MAKES THE PIG UNSEEN
        CCMenuItemImage *pig = [CCMenuItemImage itemFromNormalImage:@"pig.png" selectedImage:@"pig.png"];
        CCMenu *pigAction = [CCMenu menuWithItems:pig, nil];
         */
        [self addChild:pig];
        //make the pig move up and down on the screen
        CCMoveTo *movePiggy = [CCMoveTo actionWithDuration:10.0 position:ccp(275, 100)];
        [pig runAction:movePiggy];
               
        //add snake sprite
        snake = [CCSprite spriteWithFile:@"snake.png"];
        snake.position = ccp(375,45);
        [self addChild:snake];
        
        //lose
       // [hudlayer showRestartMenu:NO];
        
        //win
        //[hudlayer showRestartMenu:YES];
        
    
    }
	return self;
}

//CLICK THE SNAKE TO MAKE HIM JUMP UP AND DOWN AND PLAY SOUND
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    id jump = [CCJumpBy actionWithDuration:0.5 position:ccp(0,0) height:150 jumps:5];
    //the sound effect takes a second to start playing, click more than once please
    [[SimpleAudioEngine sharedEngine] playEffect:@"snake.wav"];
    [snake runAction:jump];
}



// on "dealloc" you need to release all your retained objects


@end
