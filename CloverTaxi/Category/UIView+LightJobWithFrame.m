#import "UIView+LightJobWithFrame.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (LightJobWithFrame)

#pragma mark ---------------------------------------------------------------------------------------
#pragma mark - Accessors

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (CGFloat)rightX
{
    return (self.frame.size.width+self.frame.origin.x);
}

- (CGFloat)bottomY
{
    return (self.frame.size.height+self.frame.origin.y);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

#pragma mark ---------------------------------------------------------------------------------------
#pragma mark - Setters

- (void)placeWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)placeHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)placeSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)placeOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)placeOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (void)placeOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)placeCenterByY:(CGFloat)centerY
{
    CGRect frame = self.frame;
    frame.origin.y = centerY-[self height]/2.f;
    self.frame = frame;
}

- (void)placeCenterByX:(CGFloat)centerX
{
    CGRect frame = self.frame;
    frame.origin.x = centerX-[self width]/2.f;
    self.frame = frame;
}

- (void)placeBottomY:(CGFloat)bottomY
{
    CGRect frame = self.frame;
    frame.origin.y = bottomY - [self height];
    self.frame = frame;
}

@end
