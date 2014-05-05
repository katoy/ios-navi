//
//  SubMenuViewController.m
//  navi
//
//  Created by katoy on 2014/05/05.
//  Copyright (c) 2014年 Youichi Kato. All rights reserved.
//

#import "SubMenuViewController.h"

@interface SubMenuViewController ()
{
    NSArray * cellList;
}
@end

@implementation SubMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super viewDidLoad];
    // セルデータ
    NSString * cell0 = @"地図";
    NSString * cell1 = @"カレンダー";
    cellList = @[cell0, cell1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

// セルを設定する。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = cellList[indexPath.row];  // テキスト
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // アクセサリ- (> を表示)
    return cell;
}

#pragma mark - Table voew delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"showMap" sender:self];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"showCalendar" sender:self];
    }
}
@end
