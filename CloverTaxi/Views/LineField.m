//
//  LineField.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/21/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "LineField.h"

@implementation LineField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self != nil) {
        self.borderStyle = UITextBorderStyleNone;
        _lineColor = [UIColor darkGrayColor];
        _lineHeight = 1;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect {
    UIBezierPath* line = [[UIBezierPath alloc]init];
    line.lineWidth = _lineHeight / 2;
    [line moveToPoint:(CGPoint){0, self.height - self.height / 8 - _lineHeight / 4}];
    [line addLineToPoint:(CGPoint){self.width, self.height - self.height / 8 - _lineHeight / 4}];
    
    [_lineColor setStroke];
    [line stroke];
}


//------------------------------------------------------------------------------
- (void)markError {
    UIBezierPath* line = [[UIBezierPath alloc]init];
    line.lineWidth = _lineHeight / 2;
    [line moveToPoint:(CGPoint){0, self.height - self.height / 8 - _lineHeight / 4}];
    [line addLineToPoint:(CGPoint){self.width - 10, self.height - self.height / 8 - _lineHeight / 4}];
    
    [[UIColor redColor] setStroke];
    [line stroke];
}

//------------------------------------------------------------------------------
- (BOOL)validate {
    return YES;
}

@end
