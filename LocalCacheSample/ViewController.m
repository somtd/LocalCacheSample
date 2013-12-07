//
//  ViewController.m
//  LocalCacheSample
//
//  Created by SOMTD on 2013/12/07.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataController.h"
#import "Oden.h"
#import "OdenCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray  *odens;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) IBOutlet UITableView *odensView;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation ViewController

- (void)awakeFromNib
{
    self.odensView.delegate   = self;
    self.odensView.dataSource = self;
    
    //Fetch ExGameData
    self.managedObjectContext = [[CoreDataController sharedInstance] newManagedObjectContext];
    [self loadOdenFromCoreData];
    
    //Custom Cell
    [self.odensView registerNib:[UINib nibWithNibName:@"OdenCell" bundle:nil] forCellReuseIdentifier:@"OdenCell"];
    
    //Inset
    self.odensView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
    
}

- (void)loadOdenFromCoreData {
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Oden"];
        [request setSortDescriptors:[NSArray arrayWithObject:
                                     [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO]]];
        self.odens = [self.managedObjectContext executeFetchRequest:request error:&error];
        [self.odensView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.odens count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OdenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OdenCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Oden *oden = [self.odens objectAtIndex:indexPath.row];
    cell.nameLabel.text = oden.name;
    cell.detailView.text = oden.detail;
    cell.imageView.image = [UIImage imageWithData:oden.image];
    return cell;
}

#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
