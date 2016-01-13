//
//  SettingsController.m
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "SettingsController.h"
#import "AboutController.h"
#import "SettingsDetailController.h"

@interface SettingsController ()
{
    UITableView *_tableView;
    NSArray *_options;
    NSArray *_optionSelections;
    NSArray *_optionsNotes;
}

@end

@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    [self buildTableView];
    
    [self commonInit];
}

-(void)setupUI
{
    //设置右上角按钮
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(clickDone)];
    self.navigationItem.rightBarButtonItem = done;
    
    self.navigationController.navigationBar.tintColor = [GSTATE scoreBoardColor];
    self.title = @"Settings";
}

-(void)buildTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)clickDone
{
    if ([_delegate respondsToSelector:@selector(update)]) {
        [_delegate update];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)commonInit
{
    _options = @[@"Game Type", @"Board Size", @"Theme"];
    
    _optionSelections = @[@[@"Powers of 2", @"Powers of 3", @"Fibonacci"],
                          @[@"3 x 3", @"4 x 4", @"5 x 5"],
                          @[@"Default", @"Light", @"Warm"]];
    
    _optionsNotes = @[@"For Fibonacci games, a tile can be joined with a tile that is one level above or below it, but not to one equal to it. For Powers of 3, you need 3 consecutive tiles to be the same to trigger a merge!",
                      @"The smaller the board is, the harder! For 5 x 5 board, two tiles will be added every round if you are playing Powers of 2.",
                      @"Choose your favorite appearance and get your own feeling of 2048! More (and higher quality) themes are in the works so check back regularly!"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

# pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section ? 1 : _options.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section) return @"";
    return @"Please note: Changing the settings above would restart the game.";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Settings Cell";
    //forIndexPath:indexPath 跟 storyboard 配套使用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Configure the cell ...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section) {
        cell.textLabel.text = @"About 2048";
        cell.detailTextLabel.text = @"";
    } else {
        cell.textLabel.text = [_options objectAtIndex:indexPath.row];
        
        NSInteger index = [Settings integerForKey:[_options objectAtIndex:indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = [[_optionSelections objectAtIndex:indexPath.row] objectAtIndex:index];
        cell.detailTextLabel.textColor = [GSTATE scoreBoardColor];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) { //click about item
        AboutController *about = [[AboutController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
    } else {
        SettingsDetailController *settingDetail = [[SettingsDetailController alloc] initWithStyle:UITableViewStyleGrouped];
        settingDetail.options = [NSArray arrayWithArray:_optionSelections[indexPath.row]];
        settingDetail.name = _options[indexPath.row];
        settingDetail.footer = _optionsNotes[indexPath.row];
        [self.navigationController pushViewController:settingDetail animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
