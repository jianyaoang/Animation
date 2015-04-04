//
//  ViewController.m
//  Drawing-Animation
//
//  Created by VLT Labs on 4/4/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self animateDrawingT];
    [self drawingAndAnimatingCircle];
}

/*
    CAShapeLayer is a subclass of CALayer. It is drawn through the specified shape via the path (CGPath) property. Being a subclass, it inherits properties from CALayer, which includes animation.
*/

-(void)animateDrawingT
{
    //letter T
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(50.0, 300)];
    [bezierPath addLineToPoint:CGPointMake(300, 300)];
    [bezierPath moveToPoint:CGPointMake(175, 300)];
    [bezierPath addLineToPoint:CGPointMake(175, 600)];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.lineWidth = 2.5f;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = nil;
    shapeLayer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    basicAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    basicAnimation.duration = 1.0f;
    [shapeLayer addAnimation:basicAnimation forKey:@"strokeEnd"];
    
}

-(void)drawingAndAnimatingCircle
{
    CGRect bounds = CGRectMake(0, 0, 100, 100);
    
    //Create CAShapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = bounds;
    shapeLayer.position = self.view.center;
    shapeLayer.cornerRadius = bounds.size.width /2;
    
    [self.view.layer addSublayer:shapeLayer];
    
    //an easier way to draw a circle, using UIBezierPath convenient initializer
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds].CGPath;
    shapeLayer.lineWidth = 3.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1.1;
    
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.toValue = [NSNumber numberWithFloat:1.1f];
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[startAnimation, endAnimation];
    group.duration = 3.5;
    group.autoreverses = YES;
    group.repeatCount = HUGE; //HUGE = forever
    
    [shapeLayer addAnimation:group forKey:nil];
    
}


@end
