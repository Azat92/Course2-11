//
//  ViewController.m
//  Lesson12
//
//  Created by Azat Almeev on 20.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate> {
    CGPoint offset;
}
@property (weak, nonatomic) IBOutlet UIView *demoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.panGestureRecognizer requireGestureRecognizerToFail:self.swipeRecognizer];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)swipeAction:(id)sender {
    NSLog(@"Swipe");
}

- (IBAction)panRecognizerDidFire:(UIGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        offset = CGPointMake(self.leadingConstraint.constant - location.x, self.topConstraint.constant - location.y);
    } else {
        self.topConstraint.constant = location.y + offset.y;
        self.leadingConstraint.constant = location.x + offset.x;
    }
//    NSLog(@"%@", NSStringFromCGPoint(location));
}

- (IBAction)buttonDidClick:(id)sender {
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.topConstraint.constant += 100;
        self.widthConstraint.constant /= 2;
        self.demoView.alpha /= 2;
        self.demoView.backgroundColor = [UIColor blueColor];
        self.demoView.transform = CGAffineTransformMakeScale(.5, .5);
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
//        NSLog(@"Animation completed");
    }];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    NSLog(@"%@", NSStringFromCGPoint(point));
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    NSLog(@"%@", NSStringFromCGPoint(point));
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//}

@end
