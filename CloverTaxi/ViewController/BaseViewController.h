//
//  BaseViewController.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/4/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)processError:(NSError*) error;
- (void)processErrorWithMessage:(NSString*)error;

@end
