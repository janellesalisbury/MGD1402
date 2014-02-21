//
//  PauseSceneLayer.m
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/20/14.
//  Copyright 2014 Janelle Salisbury. All rights reserved.
//

#import "PauseSceneLayer.h"
#import "HelloWorldLayer.h"
#import "IntroLayer.h"




@implementation PauseSceneLayer

+(id)scene
{
    CCScene *scene = [CCScene node];
    PauseSceneLayer *layer = [PauseSceneLayer node];
    [scene addChild:layer];
    return scene;
}

-(id)init
{
    if (self = [super init]) {
        //Pause label
        CCLabelTTF *pauseLabel = [CCLabelTTF labelWithString:@"Paused" fontName:@"Times New Roman" fontSize:45];
        pauseLabel.position = ccp(250, 150);
        [self addChild:pauseLabel];
        [CCMenuItemFont setFontName:@"Times New Roman"];
        [CCMenuItemFont setFontSize:45];
        
        //resume game label
        CCMenuItem *Resume= [CCMenuItemFont itemFromString:@"Resume" target:self selector:@selector(resume:)];
        
        //quit the game label
        CCMenuItem *Quit = [CCMenuItemFont itemFromString:@"Quit Game" target:self selector:@selector(GoToMainMenu:)];
        
        CCMenu *menu= [CCMenu menuWithItems: Resume, Quit, nil];
        menu.position = ccp(249, 131.67f);
        [menu alignItemsVerticallyWithPadding:12.5f];
        
        [self addChild:menu];
        
    }
    return self;
        
}

-(void)resumeGame:(id)sender
{
    //[[CCDirector sharedDirector] HelloWorldLayer];
}
-(void)quitGame:(id)sender
{
    [[CCDirector sharedDirector] sendCleanupToScene];
    //[[CCDirector sharedDirector] HelloWorldLayer];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[IntroLayer node]]];
}

@end
