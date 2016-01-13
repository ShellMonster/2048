//
//  SettingsDetailController.m
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "SettingsDetailController.h"

@interface SettingsDetailController ()

@end

@implementation SettingsDetailController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.navigationController.navigationBar.tintColor = [GSTATE scoreBoardColor];
    self.title = _name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.footer;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Settings Detail Cell";
    //forIndexPath:indexPath 跟 storyboard 配套使用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Configure the cell ...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.options objectAtIndex:indexPath.row];
    cell.accessoryType = ([Settings integerForKey:self.title] == indexPath.row) ?
    UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.tintColor = [GSTATE scoreBoardColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [Settings setInteger:indexPath.row forKey:self.title];
    [self.tableView reloadData];
    GSTATE.needRefresh = YES;
}

@end
