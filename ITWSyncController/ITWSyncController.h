//
//  ITWSyncController.h
//  Notger
//
//  Created by Bruno Wernimont on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ISC_USE_ARC
#define ISC_USE_ARC __has_feature(objc_arc)
#endif

#if ISC_USE_ARC
#define ISC_RETAIN(xx)           xx
#define ISC_RELEASE(xx)
#define ISC_AUTORELEASE(xx)      xx
#else
#define ISC_RETAIN(xx)           [xx retain];
#define ISC_RELEASE(xx)          [xx release];
#define ISC_AUTORELEASE(xx)      [xx autorelease];
#endif

typedef enum {
    ISCStatusSync = 0,
    ISCStatusSleep = 1,
} ISCStatus;


typedef void (^ISCBasicBlock)(void);

@interface ITWSyncController : NSObject

@property (nonatomic, assign) ISCStatus status;
@property (nonatomic, copy) NSString *didStartNotificationName;
@property (nonatomic, copy) NSString *didSuccessNotificationName;
@property (nonatomic, copy) NSString *didFailNotificationName;

+ (id)sharedInstance;

- (void)startSyncing;

- (void)didSuccessSync;

- (void)didFailSync;

- (void)setDidStartSyncBlock:(ISCBasicBlock)block;

- (void)setDidSuccessSyncBlock:(ISCBasicBlock)block;

- (void)setDidFailSyncBlock:(ISCBasicBlock)block;

+ (void)startSyncing;

+ (void)didSuccessSync;

+ (void)didFailSync;

+ (void)setDidStartSyncBlock:(ISCBasicBlock)block;

+ (void)setDidSuccessSyncBlock:(ISCBasicBlock)block;

+ (void)setDidFailSyncBlock:(ISCBasicBlock)block;

+ (void)setDidStartNotificationName:(NSString *)didStartNotificationName;

+ (void)setDidSuccessNotificationName:(NSString *)didSuccessNotificationName;

+ (void)setDidFailNotificationName:(NSString *)didFailNotificationName;

@end
