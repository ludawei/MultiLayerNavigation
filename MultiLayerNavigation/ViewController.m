//
//  ViewController.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-12.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "ViewController.h"
#import "MLNavigationController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *lbl;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"1";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, self.view.bounds.size.width-100, 200)];
    label.font = [UIFont systemFontOfSize:250];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    self.lbl = label;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(label.frame)+5, self.view.bounds.size.width-100, 50)];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"Push a new controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.title = [NSString stringWithFormat:@"%ld",
                      self.navigationController.viewControllers.count];
    }else{
        self.title = [NSString stringWithFormat:@"%@",
                      self.navigationController.title];
    }
    
    self.lbl.text = [NSString stringWithFormat:@"%ld",self.navigationController.viewControllers.count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Interaction -

- (void)pressBtn:(UIButton *)sender
{
    ViewController *vc = [ViewController new];
    vc.view.backgroundColor = [UIColor colorWithHue:arc4random_uniform(255)/255.0 saturation:1.0 brightness:1.0 alpha:1.0];
    vc.title = self.title;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
