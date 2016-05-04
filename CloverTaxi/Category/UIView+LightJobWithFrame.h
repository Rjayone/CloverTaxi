#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIView (LightJobWithFrame)

//Getters
- (CGFloat)width;

- (CGFloat)height;

- (CGSize)size;

- (CGFloat)originX;

- (CGFloat)originY;

- (CGFloat)rightX;

- (CGFloat)bottomY;

- (CGPoint)origin;
//--------------------------------------------------------------------------------------------------

//Setters
- (void)placeWidth:(CGFloat)width;

- (void)placeHeight:(CGFloat)height;

- (void)placeSize:(CGSize)size;

- (void)placeOriginX:(CGFloat)originX;

- (void)placeOriginY:(CGFloat)originY;

- (void)placeOrigin:(CGPoint)origin;

- (void)placeCenterByY:(CGFloat)centerY;

- (void)placeCenterByX:(CGFloat)centerX;

- (void)placeBottomY:(CGFloat)bottomY;
//--------------------------------------------------------------------------------------------------

@end
