//
//  SyncEngine.h
//  GameWiki
//
//  Created by SOMTD on 2013/08/20.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kSDSyncEngineDownloadCompleteNotification;
extern NSString * const kSDSyncEngineSyncCompletedNotificationName;

typedef enum {
    ObjectSynced = 0,
} ObjectSyncStatus;

//Thanks to
//http://www.raywenderlich.com/15916/how-to-synchronize-core-data-with-a-web-service-part-1#

@interface SyncEngine : NSObject

@property (atomic, readonly) BOOL syncInProgress;

+ (SyncEngine *)sharedEngine;

- (void)registerNSManagedObjectClassToSync:(Class)aClass;
- (void)startSync;

@end
