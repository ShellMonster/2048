//
//  ViewController.m
//  2048
//
//  Created by dengwei on 15/12/12.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "ViewController.h"
#import "SettingsController.h"
#import "ScoreView.h"
#import "Overlay.h"
#import "MyScene.h"
#import "GridView.h"

@interface ViewController ()<SettingsDelegate>
{
    UIButton *_restartButton;
    UIButton *_settingsButton;
    UILabel *_targetScore;
    ScoreView *_scoreView;
    ScoreView *_bestView;
    
    MyScene *_scene;
    SKView *_skView;
    
    Overlay *_overlay;
    UIImageView *_overlayBackground;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupSence];
    
    [self setupUI];
    
    [self updateState];
}

-(void)setupUI
{
    
    _overlayBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_overlayBackground];
    
    _overlay = [[Overlay alloc] initWithFrame:CGRectMake(60, 237, 200, 174)];
    [_skView addSubview:_overlay];
    
    _bestView = [[ScoreView alloc] initWithFrame:CGRectMake(155, 48, 140, 51)];
    _bestView.title.text = @"Best";
    [_skView addSubview:_bestView];
    
    _scoreView = [[ScoreView alloc] initWithFrame:CGRectMake(155, 114, 140, 51)];
    _scoreView.title.text = @"Score";
    [_skView addSubview:_scoreView];
    
    _targetScore = [[UILabel alloc] initWithFrame:CGRectMake(16, 32, 131, 56)];
    [_skView addSubview:_targetScore];
    
    _settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(16, 95, 116, 30)];
    [_settingsButton addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    [_skView addSubview:_settingsButton];
    /*add long touch event function*/
    UILongPressGestureRecognizer *longPressGR =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(longPress)];
    longPressGR.minimumPressDuration = 2.0;
    [_settingsButton addGestureRecognizer:longPressGR];
    
    _restartButton = [[UIButton alloc] initWithFrame:CGRectMake(16, 135, 116, 30)];
    [_restartButton addTarget:self action:@selector(restartAction) forControlEvents:UIControlEventTouchUpInside];
    [_skView addSubview:_restartButton];
    
    _bestView.score.text = [NSString stringWithFormat:@"%ld", (long)[Settings integerForKey:@"Best Score"]];
    
    _restartButton.layer.cornerRadius = [GSTATE cornerRadius];
    _restartButton.layer.masksToBounds = YES;
    
    _settingsButton.layer.cornerRadius = [GSTATE cornerRadius];
    _settingsButton.layer.masksToBounds = YES;
    
    _overlay.hidden = YES;
    _overlayBackground.hidden = YES;
}

-(void)setupSence
{
    // Configure the view.
    SKView *skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:skView];
    _skView = skView;
    
    // Create and configure the scene.
    MyScene *scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    [self updateScore:0];
    [scene startNewGame];
    
    _scene = scene;
    _scene.controller = self;
}

#pragma mark long press event function
-(void)longPress
{
    NSInteger score = 0;
    score = [_scoreView.score.text integerValue];
    score += (arc4random_uniform(1000) + 500);
    [self updateScore:score];
    XLog(@"longPress:%zi", score);
}

-(void)settingAction
{
    _skView.paused = YES;
    SettingsController *settings = [[SettingsController alloc] init];
    settings.delegate = self;
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:settings];
    [self presentViewController:settingNav animated:YES completion:nil];
}

#pragma mark SettingsDelegate method
-(void)update
{
    _skView.paused = NO;
    if (GSTATE.needRefresh) {
        [GSTATE loadGlobalState];
        [self updateState];
        [self updateScore:0];
        [_scene startNewGame];
    }
}

-(void)restartAction
{
    [self hideOverlay];
    [self updateScore:0];
    [_scene startNewGame];
}

- (void)keepPlayingAction
{
    [self hideOverlay];
}

- (void)updateState
{
    [_scoreView updateAppearance];
    [_bestView updateAppearance];
    
    _restartButton.backgroundColor = [GSTATE buttonColor];
    [_restartButton setTitle:@"Restart" forState:UIControlStateNormal];
    _restartButton.titleLabel.font = [UIFont fontWithName:[GSTATE boldFontName] size:14];
    
    _settingsButton.backgroundColor = [GSTATE buttonColor];
    [_settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    _settingsButton.titleLabel.font = [UIFont fontWithName:[GSTATE boldFontName] size:14];
    
    _targetScore.textColor = [GSTATE buttonColor];
    
    long target = [GSTATE valueForLevel:GSTATE.winningLevel];
    XLog(@"level:%zi",GSTATE.winningLevel);
    
    if (target > 100000) {
        _targetScore.font = [UIFont fontWithName:[GSTATE boldFontName] size:34];
    } else if (target < 10000) {
        _targetScore.font = [UIFont fontWithName:[GSTATE boldFontName] size:42];
    } else {
        _targetScore.font = [UIFont fontWithName:[GSTATE boldFontName] size:40];
    }
    
    _targetScore.text = [NSString stringWithFormat:@"%ld", target];
    
    _overlay.message.font = [UIFont fontWithName:[GSTATE boldFontName] size:36];
    _overlay.keepPlaying.titleLabel.font = [UIFont fontWithName:[GSTATE boldFontName] size:17];
    _overlay.restartGame.titleLabel.font = [UIFont fontWithName:[GSTATE boldFontName] size:17];
    
    _overlay.message.textColor = [GSTATE buttonColor];
    [_overlay.keepPlaying setTitleColor:[GSTATE buttonColor] forState:UIControlStateNormal];
    [_overlay.keepPlaying addTarget:self action:@selector(keepPlayingAction) forControlEvents:UIControlEventTouchUpInside];
    [_overlay.restartGame setTitleColor:[GSTATE buttonColor] forState:UIControlStateNormal];
    [_overlay.restartGame addTarget:self action:@selector(restartAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateScore:(NSInteger)score
{
    _scoreView.score.text = [NSString stringWithFormat:@"%ld", (long)score];
    if ([Settings integerForKey:@"Best Score"] < score) {
        [Settings setInteger:score forKey:@"Best Score"];
        _bestView.score.text = [NSString stringWithFormat:@"%ld", (long)score];
    }
}

- (void)endGame:(BOOL)won
{
    _overlay.hidden = NO;
    _overlay.alpha = 0;
    _overlayBackground.hidden = NO;
    _overlayBackground.alpha = 0;
    
    if (!won) {
        _overlay.keepPlaying.hidden = YES;
        _overlay.message.text = @"Game Over";
    } else {
        _overlay.keepPlaying.hidden = NO;
        _overlay.message.text = @"You Win!";
    }
    
    // Fake the overlay background as a mask on the board.
    _overlayBackground.image = [GridView gridImageWithOverlay];
    
    // Center the overlay in the board.
    CGFloat verticalOffset = [[UIScreen mainScreen] bounds].size.height - GSTATE.verticalOffset;
    NSInteger side = GSTATE.dimension * (GSTATE.tileSize + GSTATE.borderWidth) + GSTATE.borderWidth;
    _overlay.center = CGPointMake(GSTATE.horizontalOffset + side / 2, verticalOffset - side / 2);
    
    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _overlay.alpha = 1;
        _overlayBackground.alpha = 1;
    } completion:^(BOOL finished) {
        // Freeze the current game.
        _skView.paused = YES;
    }];
}


- (void)hideOverlay
{
    _skView.paused = NO;
    if (!_overlay.hidden) {
        [UIView animateWithDuration:0.5 animations:^{
            _overlay.alpha = 0;
            _overlayBackground.alpha = 0;
        } completion:^(BOOL finished) {
            _overlay.hidden = YES;
            _overlayBackground.hidden = YES;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
