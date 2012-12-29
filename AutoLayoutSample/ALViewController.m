//
//  ALViewController.m
//  AutoLayoutSample
//
//  Created by えいる on 2012/12/29.
//  Copyright (c) 2012年 Tomohiko Himura. All rights reserved.
//

#import "ALViewController.h"

@interface ALViewController ()

@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView* redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    // デフォルトでは AutoresizingMask をエミュレートするようになっているので切る
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];

    UIView* blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];

    NSNumber* padding = @20;
    // Visual Format Language 内で redView, blueViewを参照できるようにする
    NSDictionary* binding = NSDictionaryOfVariableBindings(redView,blueView);
    // Visual Format Language 内で paddingという値を参照できるようにする
    NSDictionary* metrics = NSDictionaryOfVariableBindings(padding);
    // redView と blueView を同じサイズで 左マージンを揃える
    // metricsに metcrics と views に binding を渡しているので padding や redView が使える
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[redView(200)]" options:0 metrics:metrics views:binding]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[blueView(==redView)]" options:0 metrics:metrics views:binding]];
    // redView と blueView を縦に並べる
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[redView]|" options:0 metrics:metrics views:binding]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(40)]-padding-[blueView(==redView)]" options:0 metrics:metrics views:binding]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
