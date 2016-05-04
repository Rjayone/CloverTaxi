//
//  LineField.h
//  Outlay
//
//  Created by Andrew Medvedev on 2/21/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LineFieldDelegate;

IB_DESIGNABLE
@interface LineField : UITextField

@property (strong, nonatomic) IBInspectable UIColor* lineColor;
@property (assign, nonatomic) IBInspectable CGFloat lineHeight;
@property (strong, nonatomic) NSCharacterSet* validationSet;

- (BOOL)validate;

@end