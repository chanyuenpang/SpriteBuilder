//
//  CCBPNode.m
//  SpriteBuilder
//
//  Created by Viktor on 12/17/13.
//
//

#import "CCBPBatchNode.h"

@implementation CCBPBatchNode

@synthesize png;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    return self;
}

- (void) setPng:(NSString *)selected
{
    if (selected) png = selected;
    else png = @"";
    [png retain];
}

- (void) dealloc {
    self.png = NULL;
    [super dealloc];
}

@end

