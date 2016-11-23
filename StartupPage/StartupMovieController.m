//
//  StartupMovieController.m
//  StartupPage
//
//  Created by user on 16/11/22.
//  Copyright © 2016年 zshuo50. All rights reserved.
//

#import "StartupMovieController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

#import "ViewController.h"

@interface StartupMovieController ()
@property(nonatomic,strong)MPMoviePlayerController *myPlayController;

@end

@implementation StartupMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    _myPlayController = [[MPMoviePlayerController alloc] initWithContentURL:_MovieURL];
    [self.view addSubview:_myPlayController.view];
    _myPlayController.shouldAutoplay = YES;
    [_myPlayController setControlStyle:MPMovieControlStyleNone];
    _myPlayController.repeatMode = MPMovieRepeatModeOne;
    [_myPlayController.view setFrame:self.view.bounds];
    _myPlayController.view.alpha = 0;
    [UIView animateWithDuration:3 animations:^{
        _myPlayController.view.alpha = 1;
        [_myPlayController prepareToPlay];
    }];
 
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 24;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    [button setTitle:@"进入应用" forState:UIControlStateNormal];
    button.alpha = 0;
    [_myPlayController.view addSubview:button];
    [button addTarget:self action:@selector(EnterHome:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [UIView animateWithDuration:3.0 animations:^{
        button.alpha = 1.0;
    }];
}

-(void)EnterHome:(UIButton *)sender
{
    ViewController *view = [[ViewController alloc]init];
    [self presentViewController:view animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
