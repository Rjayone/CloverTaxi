//
//  BasicCell.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "BasicCell.h"
#import "LineField.h"

@interface BasicCell ()

@property (weak, nonatomic) IBOutlet LineField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation BasicCell

//------------------------------------------------------------------------------
- (void)awakeFromNib {
    [super awakeFromNib];
}

//------------------------------------------------------------------------------
- (void)configureCellWithParams:(NSDictionary*)params {
    self.descriptionLabel.text = params[@"description"];
}

@end
