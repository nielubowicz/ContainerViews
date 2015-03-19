//
//  ViewController.m
//  ContainerViews
//
//  Created by chris nielubowicz on 3/17/15.
//  Copyright (c) 2015 Assorted Intelligence. All rights reserved.
//

#import "ViewController.h"
#import "RandomColorViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) NSTimer *changeViewControllerTimer;
@property (strong, nonatomic) RandomColorViewController *currentRandomColorViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.changeViewControllerTimer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                                      target:self
                                                                    selector:@selector(changeViewController:)
                                                                    userInfo:nil
                                                                     repeats:YES];
}

-(void)changeViewController:(NSTimer *)timer
{

    RandomColorViewController *randomColorViewController = [[RandomColorViewController alloc] initWithNibName:nil bundle:nil];
    
    [self addChildViewController:randomColorViewController];
    
    if (self.currentRandomColorViewController) {
        [self.currentRandomColorViewController willMoveToParentViewController:nil];
        [self transitionFromViewController:self.currentRandomColorViewController
                          toViewController:randomColorViewController
                                  duration:0.5f
                                   options:UIViewAnimationOptionTransitionFlipFromBottom
                                animations:^{
                                    
                                } completion:^(BOOL finished) {
                                    [self.currentRandomColorViewController.view removeFromSuperview];
                                    [self setCurrentRandomColorViewController:randomColorViewController];
                                }];
    }
    else {
        [self setCurrentRandomColorViewController:randomColorViewController];
    }
}

- (void)setCurrentRandomColorViewController:(RandomColorViewController *)currentRandomColorViewController
{
    _currentRandomColorViewController = currentRandomColorViewController;
    self.currentRandomColorViewController.view.frame = self.container.bounds;
    [self.container addSubview:self.currentRandomColorViewController.view];
    [self.currentRandomColorViewController didMoveToParentViewController:self];
}

@end
