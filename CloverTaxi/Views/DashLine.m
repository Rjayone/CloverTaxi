//
//  DashLine.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/28/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "DashLine.h"

@implementation DashLine

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self != nil) {
        _lineWidth = 10;
        _spaceWidth = 5;
        _lineHeight = 1;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self != nil) {
        _lineWidth = 10;
        _spaceWidth = 5;
        _lineHeight = 1;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CAShapeLayer* layer = [CAShapeLayer layer];
    
    UIBezierPath* line = [[UIBezierPath alloc]init];
    [line moveToPoint:(CGPoint){0, self.height / 2}];
    [line addLineToPoint:(CGPoint){self.width, self.height / 2}];
    
    layer.lineWidth = _lineHeight;
    layer.strokeColor = self.tintColor.CGColor;
    layer.path = line.CGPath;
    layer.lineDashPattern = @[@(_lineWidth), @(_spaceWidth)];
    [self.layer addSublayer:layer];
}

@end
