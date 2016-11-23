//
//  AppDelegate.m
//  StartupPage
//
//  Created by user on 16/11/22.
//  Copyright © 2016年 zshuo50. All rights reserved.
//

#import "AppDelegate.h"
#import "StartupPageController.h"
#import "StartupMovieController.h"
#import "StartGIFController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
    //这是系统launchimage延时方法
    [NSThread sleepForTimeInterval:3.0f];
     */
    
    /*
    //2.仿系统launchimage
    [self.window makeKeyAndVisible];
    UIImageView *startupage = [[UIImageView alloc]initWithFrame:self.window.bounds];
    [startupage setImage:[UIImage imageNamed:@"20161122.jpeg"]];
    [self.window addSubview:startupage];
    [self.window bringSubviewToFront:startupage];
    startupage.alpha = 0.99;
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        startupage.alpha = 1;
    } completion:^(BOOL finished) {
        [startupage removeFromSuperview];
    }];
     */
    
    BOOL isFirst = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirst"]boolValue];
    if (!isFirst) {
        //第一次启动
        
         //3.多页启动页
         StartupPageController *startup = [[StartupPageController alloc]init];
         startup.ImageArray = @[@"海贼01.jpg",@"海贼02.jpg",@"海贼03.jpg",@"海贼04.jpg",@"海贼05.jpg",@"海贼06.jpg"];
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"isFirst"];
         self.window.rootViewController = startup;
         
    }else
    {
        //非第一次
        ViewController *view = [[ViewController alloc]init];
        self.window.rootViewController = view;
    }
    
   
    
    /*
    //4.视频启动页
    StartupMovieController *startMovie = [[StartupMovieController alloc]init];
    startMovie.MovieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"2016" ofType:@"mov"]];
    self.window.rootViewController = startMovie;
   */
    
    /*
    //5.GIF启动页
    StartGIFController *gif = [[StartGIFController alloc]init];
    gif.GIFURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"1123" ofType:@"gif"]];
    self.window.rootViewController = gif;
    */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
