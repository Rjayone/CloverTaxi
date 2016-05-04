//
//  BasicCell.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LineField;


@interface BasicCell : UITableViewCell

@property (weak, nonatomic, readonly) IBOutlet LineField *inputField;

- (void)configureCellWithParams:(NSDictionary*)params;

@end
