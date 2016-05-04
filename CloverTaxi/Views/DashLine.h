//
//  DashLine.h
//  Outlay
//
//  Created by Andrew Medvedev on 2/28/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DashLine : UIView

@property (assign, nonatomic) IBInspectable NSInteger lineWidth;
@property (assign, nonatomic) IBInspectable NSInteger spaceWidth;
@property (assign, nonatomic) IBInspectable NSInteger lineHeight;

@end
