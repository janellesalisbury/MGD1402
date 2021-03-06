//
//  HelloWorldLayer.h
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/6/14.
//  Copyright Janelle Salisbury 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "HUDLayer.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    HUDLayer *hudlayer;
    CCSprite *pig;
    float x, y;
    
}

-(id)initWithHUD: (HUDLayer *)hud;
-(void)jumpSnake;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
