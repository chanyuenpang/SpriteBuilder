/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "CCBPTMXLayer.h"
#import "ResourceManager.h"
#import "CCBReaderInternal.h"
#import "CCBGlobals.h"
#import "CCBDocument.h"
#import "AppDelegate.h"
#import "CCNode+NodeInfo.h"

@implementation CCBPTMXLayer

@synthesize tmxFile;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    return self;
}

- (void) setTmxFile:(NSString *)tmx
{
    tmxFile = [tmx retain];
    
    NSString* fileName = [[ResourceManager sharedManager] toAbsolutePath:tmx];
    
    [self removeAllChildrenWithCleanup:YES];
    CCTiledMap* tMap = [CCTiledMap tiledMapWithFile:fileName];
    if (tMap)
    {
        [self addChild:tMap];
        self.contentSize = tMap.contentSize;
        tMap.anchorPoint = ccp(0,0);
    }
    else
    {
        self.contentSize = CGSizeZero;
        self.anchorPoint = ccp(0,0);
    }
}

- (void) dealloc {
    self.tmxFile = NULL;
    [super dealloc];
}

@end
