//
//  CircularProgressView.m
//  CustomizableCircularProgress
//
//  Created by Elton Mendes Vieira Junior on 2/25/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "CircularProgressView.h"

@interface CircularProgressView ()


@property (nonatomic,strong) CAShapeLayer *circleShapeLayer;
@property (nonatomic) IBInspectable UIColor *strokeColor;
@property (nonatomic) IBInspectable UIColor *fillColor;
@property (nonatomic) IBInspectable UIColor *backgroundColor;
@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable BOOL isClockWise;

@end

@implementation CircularProgressView


- (void)drawRect:(CGRect)rect {
    if(!self.circleShapeLayer)
        self.circleShapeLayer = [CAShapeLayer layer];
    
    self.circleShapeLayer.frame = rect;
    self.circleShapeLayer.backgroundColor = self.backgroundColor.CGColor;
    self.circleShapeLayer.fillColor = self.fillColor.CGColor;
    self.circleShapeLayer.strokeColor = self.strokeColor.CGColor;
    self.circleShapeLayer.lineWidth = self.lineWidth;

    UIBezierPath *circlePath;

    if(self.isClockWise){
        circlePath = [[UIBezierPath bezierPathWithOvalInRect:rect] bezierPathByReversingPath];
    }
    else{
        circlePath = [UIBezierPath bezierPathWithOvalInRect:rect];
    }
    self.circleShapeLayer.path = circlePath.CGPath;
    self.circleShapeLayer.strokeEnd = self.currentProgress;
    
    [self.layer addSublayer:self.circleShapeLayer];
}

- (void)changeProgressColor:(UIColor *)color {
    _circleShapeLayer.strokeColor = color.CGColor;
}

- (void)updateProgress:(CGFloat)progress withDuration:(NSTimeInterval)duration {
    
    CABasicAnimation *stroke = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    stroke.fromValue = @(_currentProgress);
    _currentProgress +=progress;    
    stroke.toValue = @(_currentProgress);
    stroke.duration = duration;
    stroke.removedOnCompletion = NO;
    stroke.autoreverses = NO;
    stroke.fillMode = kCAFillModeForwards;
    stroke.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_circleShapeLayer addAnimation:stroke forKey:@"strokeEndAnimation"];
    
}

- (CGFloat)currentProgress {
    return _currentProgress;
}

@end
