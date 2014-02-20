//
//  PauseSceneLayer.m
//  MGD_ProjectOne
//
//  Created by Janelle Salisbury on 2/20/14.
//  Copyright 2014 Janelle Salisbury. All rights reserved.
//

#import "PauseSceneLayer.h"


@implementation PauseSceneLayer

+(id)scene
{
    CCScene *scene = [CCScene node];
    PauseSceneLayer *layer = [PauseSceneLayer node];
    [scene addChild:layer];
    return scene;
}

@end
