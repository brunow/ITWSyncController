//
//  ITWSyncController.m
//  Notger
//
//  Created by Bruno Wernimont on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITWSyncController.h"

static id _sharedObject = nil;


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ITWSyncController ()

@property (nonatomic, copy) ISCBasicBlock _didStartSyncBlock;
@property (nonatomic, copy) ISCBasicBlock _didSuccessSyncBlock;
@property (nonatomic, copy) ISCBasicBlock _didFailSyncBlock;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ITWSyncController

@synthesize _didStartSyncBlock;
@synthesize _didSuccessSyncBlock;
@synthesize _didFailSyncBlock;
@synthesize status = _status;
@synthesize didStartNotificationName = _didStartNotificationName;
@synthesize didSuccessNotificationName = _didSuccessNotificationName;
@synthesize didFailNotificationName = _didFailNotificationName;


#if !ISC_USE_ARC
////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    self._didStartSyncBlock = nil;
    self._didSuccessSyncBlock = nil;
    self._didFailSyncBlock = nil;
    
    [super dealloc];
}
#endif


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    if (self) {
        self.status = ISCStatusSleep;
    }
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)sharedInstance {
    if (_sharedObject == nil) {
        _sharedObject = [[self alloc] init];
    }
    return _sharedObject;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)startSyncing {
    if (nil != self._didStartSyncBlock) {
        self.status = ISCStatusSync;
        self._didStartSyncBlock();
    }
    
    if (nil != self.didStartNotificationName) {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.didStartNotificationName object:nil];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didSuccessSync {
    self.status = ISCStatusSleep;
    
    if (nil != self._didSuccessSyncBlock) {
        self._didSuccessSyncBlock();
    }
    
    if (nil != self.didSuccessNotificationName) {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.didSuccessNotificationName object:nil];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didFailSync {
    self.status = ISCStatusSleep;
    
    if (nil != self._didFailSyncBlock) {
        self._didFailSyncBlock();
    }
    
    if (nil != self.didFailNotificationName) {
        [[NSNotificationCenter defaultCenter] postNotificationName:self.didFailNotificationName object:nil];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)startSyncing {
    [[self sharedInstance] startSyncing];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)didSuccessSync {
    [[self sharedInstance] didSuccessSync];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)didFailSync {
    [[self sharedInstance] didFailSync];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setter and Getter


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDidStartSyncBlock:(ISCBasicBlock)block {
    self._didStartSyncBlock = block;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDidSuccessSyncBlock:(ISCBasicBlock)block {
    self._didSuccessSyncBlock = block;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDidFailSyncBlock:(ISCBasicBlock)block {
    self._didFailSyncBlock = block;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidStartSyncBlock:(ISCBasicBlock)block {
    [[self sharedInstance] setDidStartSyncBlock:block];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidSuccessSyncBlock:(ISCBasicBlock)block {
    [[self sharedInstance] setDidSuccessSyncBlock:block];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidFailSyncBlock:(ISCBasicBlock)block {
    [[self sharedInstance] setDidFailSyncBlock:block];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidStartNotificationName:(NSString *)didStartNotificationName {
    [[self sharedInstance] setDidStartNotificationName:didStartNotificationName];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidSuccessNotificationName:(NSString *)didSuccessNotificationName {
    [[self sharedInstance] setDidSuccessNotificationName:didSuccessNotificationName];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setDidFailNotificationName:(NSString *)didFailNotificationName {
    [[self sharedInstance] setDidFailNotificationName:didFailNotificationName];
}


@end