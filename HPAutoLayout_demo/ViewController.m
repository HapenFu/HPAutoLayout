//
//  ViewController.m
//  HPAutoLayout_demo
//
//  Created by 付海鹏 on 2016/10/11.
//  Copyright © 2016年 Haipeng. All rights reserved.
//

#import "ViewController.h"
#import "HPAutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *myView = [UIView create];
    myView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:myView];
    [myView.top addEqualConstraint:self.view.top multiplier:1.f constant:20];
    [myView.left addEqualConstraint:self.view.left multiplier:1.f constant:10];
    [myView.right addEqualConstraint:self.view.right multiplier:1.f constant:-10];
    [myView.height addEqualConstraint:self.view.height multiplier:0.5 constant:0];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
