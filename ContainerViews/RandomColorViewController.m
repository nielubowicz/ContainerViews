//
//  RandomColorViewController.m
//  ContainerViews
//
//  Created by chris nielubowicz on 3/17/15.
//  Copyright (c) 2015 Assorted Intelligence. All rights reserved.
//

#import "RandomColorViewController.h"

@interface RandomColorViewController ()

@end

@implementation RandomColorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    static NSArray *colors = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colors = @[
                   [UIColor cyanColor],
                   [UIColor redColor],
                   [UIColor yellowColor],
                   [UIColor greenColor],
                   [UIColor blueColor]
                   ];
    });
    
    int randomIndex = rand() % colors.count;
    self.view.backgroundColor = colors[randomIndex];
}

@end
