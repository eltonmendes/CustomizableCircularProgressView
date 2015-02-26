//
//  CircularProgressView.h
//  CustomizableCircularProgress
//
//  Created by Elton Mendes Vieira Junior on 2/25/15.
//  Copyright Elton Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CircularProgressView : UIView

@property (nonatomic) IBInspectable CGFloat currentProgress;

- (void)updateProgress:(CGFloat)progress withDuration:(NSTimeInterval)duration;
- (void)changeProgressColor:(UIColor *)color;
- (CGFloat)currentProgress;


@end
