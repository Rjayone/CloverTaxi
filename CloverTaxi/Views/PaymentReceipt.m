//
//  PaymentReceipt.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/27/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "PaymentReceipt.h"

@implementation PaymentReceipt

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self != nil) {
        _topColor = [UIColor colorWithWhite:0.98 alpha:1];
        _bottomColor = [UIColor colorWithWhite:0.95 alpha:1];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self != nil) {
        _topColor = [UIColor colorWithWhite:0.95 alpha:1];
        _bottomColor = [UIColor colorWithWhite:0.91 alpha:1];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect {
    UIBezierPath* check = [[UIBezierPath alloc]init];
    UIBezierPath* leftStroke = [[UIBezierPath alloc]init];
    UIBezierPath* rightStroke = [[UIBezierPath alloc]init];
    NSInteger stepX = 8;
    NSInteger stepY = 5;
    NSInteger currentX = 0;
    NSInteger currentY = 0;
    NSInteger topOffset = 15;
    NSInteger bottomOffset = 10 - stepY;
    NSInteger bottomStrokeWidth = 15;
    [check moveToPoint:(CGPoint){currentX, topOffset}];
    NSInteger value = 1;
    while(currentX <= self.width) {
        value *= -1;
        currentX += stepX;
        currentY += stepY * value;
        [check addLineToPoint:(CGPoint){currentX, topOffset + currentY}];
    }
    
    //top stroke line
    UIBezierPath* topStroke = check.copy;
    [[UIColor colorWithWhite:0.8 alpha:1]setStroke];
    [[UIColor lightGrayColor]setStroke];
    [topStroke stroke];
    
    if(value == -1) {
        [check addLineToPoint:(CGPoint){currentX, self.height + bottomOffset * value / 8 - bottomStrokeWidth}];
    }
    if(value == 1) {
        [check addLineToPoint:(CGPoint){currentX, self.height - stepY - bottomStrokeWidth}];
    }
    
    
    currentX = 0;
    currentY = self.height - bottomStrokeWidth;
    [check moveToPoint:(CGPoint){currentX, currentY - bottomOffset}];
    UIBezierPath* bottomStroke = [[UIBezierPath alloc]init];
    [bottomStroke moveToPoint:(CGPoint){currentX, currentY - bottomOffset}];
    while(currentX <= self.width) {
        value *= -1;
        currentX += stepX;
        currentY += stepY * value;
        [check addLineToPoint:(CGPoint){currentX, currentY - bottomOffset}];
        [bottomStroke addLineToPoint:(CGPoint){currentX, currentY - bottomOffset}];
    }
    
    //bottom stroke line
    [[UIColor lightGrayColor]setStroke];
    bottomStroke.lineWidth = 1;
    [bottomStroke stroke];
    
    [check addLineToPoint:(CGPoint){0, topOffset}];
    
    UIBezierPath* checkPath = check.copy;
    [checkPath addClip];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSArray* colors = @[(__bridge id) _topColor.CGColor, (__bridge id) _bottomColor.CGColor];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0f, 1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    CGPoint startPoint = (CGPoint){CGRectGetMidX(rect), 0};
    CGPoint endPoint = (CGPoint){CGRectGetMidX(rect), self.height};
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    [leftStroke moveToPoint:(CGPoint){0, value}];
    [leftStroke addLineToPoint:(CGPoint){0, self.height}];
    
    [rightStroke moveToPoint:(CGPoint){self.width, value ? 0 : topOffset}];
    [rightStroke addLineToPoint:(CGPoint){self.width, self.height}];
    [rightStroke stroke];
    [leftStroke stroke];
}

@end
