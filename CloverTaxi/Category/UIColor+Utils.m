//
//  UIColor+Utils.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/29/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)

+ (UIColor*)randomColor {
    CGFloat r =  randFromTo(180, 255) / 255.f;
    CGFloat g =  randFromTo(180, 255) / 255.f;
    CGFloat b =  randFromTo(180, 255) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

//------------------------------------------------------------------------------
NSInteger randFromTo(NSInteger from, NSInteger to) {
    return from + arc4random_uniform((int)to) % (to-from+1);
}

@end
