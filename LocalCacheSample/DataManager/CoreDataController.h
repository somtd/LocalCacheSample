//
//  CoreDataController.h
//  GameWiki
//
//  Created by SOMTD on 2013/08/20.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import <Foundation/Foundation.h>

//Thanks to
//http://www.raywenderlich.com/15916/how-to-synchronize-core-data-with-a-web-service-part-1#

@interface CoreDataController : NSObject

+ (id)sharedInstance;

- (NSURL *)applicationDocumentsDirectory;

- (NSManagedObjectContext *)masterManagedObjectContext;
- (NSManagedObjectContext *)backgroundManagedObjectContext;
- (NSManagedObjectContext *)newManagedObjectContext;
- (void)saveMasterContext;
- (void)saveBackgroundContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

@end
