//
//  AboutController.m
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "AboutController.h"

@interface AboutController ()

@property (nonatomic, strong) UITextView *infoView;
@end

@implementation AboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    [self fillTextView];
}

-(void)setupUI
{
    self.title = @"About 2048";
    
    _infoView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _infoView.backgroundColor = [UIColor whiteColor];
    _infoView.font = [UIFont systemFontOfSize:16.0f];
    _infoView.textColor = [UIColor lightGrayColor];
    _infoView.userInteractionEnabled = NO;
    [self.view addSubview:_infoView];
}

-(void)fillTextView
{
    _infoView.text = @"\n\tThis game is largely based on the popular web-based game 2048, by Gabriele Cirulli. You can find the original game at http://git.io/2048. Please refer to its documentation to see its ancestors.\n\n\tAre you a developer? This game is an open source project. If you are interested in SpriteKit, the cool new addition to iOS 7, or in iOS development in general, check out its source code at http://github.com/charsdavy/2048-iphone. Any contributions or forks are highly welcome, and I hope you find the source code useful in your own development work!";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
