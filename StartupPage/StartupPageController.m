//
//  StartupPageController.m
//  StartupPage
//
//  Created by user on 16/11/22.
//  Copyright © 2016年 zshuo50. All rights reserved.
//

#import "StartupPageController.h"
#import "ViewController.h"

@interface StartupPageController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *myScrollView;
@property(nonatomic,strong)UIPageControl *myPageControl;
@end

@implementation StartupPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSInteger PageCount = [_ImageArray count];
    
    _myScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _myScrollView.delegate = self;
    _myScrollView.contentSize = CGSizeMake(self.view.frame.size.width*PageCount, 0);
    _myScrollView.pagingEnabled = YES;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_myScrollView];
    
    _myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-34, self.view.frame.size.width, 15)];
    [_myPageControl setNumberOfPages:PageCount];
    [_myPageControl setCurrentPage:0];
    _myPageControl.userInteractionEnabled = NO;
    _myPageControl.pageIndicatorTintColor = [UIColor grayColor];
    _myPageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self.view addSubview:_myPageControl];
    
    for (int i=0; i<PageCount; i++) {
        UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [myImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",_ImageArray[i]]]];
        [_myScrollView addSubview:myImageView];
        
        if (i==PageCount-1) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i+24, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width-48, 48);
            [button setTitle:@"进入主页" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.layer.borderWidth = 1;
            button.layer.borderColor = [UIColor blueColor].CGColor;
            button.layer.cornerRadius = 24;
            button.alpha = 0;
            [_myScrollView addSubview:button];
            [button addTarget:self action:@selector(EnterHome:) forControlEvents:UIControlEventTouchUpInside];
            [UIView animateWithDuration:3.0f animations:^{
                button.alpha = 1.0;
            }];
            
        }
    }
}
-(void)EnterHome:(UIButton *)sender
{
    ViewController *view = [[ViewController alloc]init];
    [self presentViewController:view animated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_myPageControl setCurrentPage:_myScrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width];
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
