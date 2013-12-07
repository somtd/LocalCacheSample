//
//  Oden.h
//  LocalCacheSample
//
//  Created by SOMTD on 2013/12/07.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Oden : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSString * objectId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSData * image;

@end
