//
//  ALPhotoFrameViewController.m
//  AutoLayoutSample
//
//  Created by えいる on 2012/12/29.
//  Copyright (c) 2012年 Tomohiko Himura. All rights reserved.
//

#import "ALPhotoFrameViewController.h"

@interface ALPhotoFrameViewController ()

@end

@implementation ALPhotoFrameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // フォトフレームっぽいものが簡単に作れそうなので作ってみる
    UIView* photoView = [[UIView alloc] init];
    photoView.backgroundColor = [UIColor redColor];
    photoView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:photoView];

    NSNumber* padding = @20;
    NSDictionary* binding = NSDictionaryOfVariableBindings(photoView);
    NSDictionary* metrics = NSDictionaryOfVariableBindings(padding);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[photoView]-padding-|" options:0 metrics:metrics views:binding]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[photoView]-padding-|" options:0 metrics:metrics views:binding]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
