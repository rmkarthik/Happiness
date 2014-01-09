//
//  FaceView.m
//  Happiness
//
//  Created by Karthik on 1/9/14.
//  Copyright (c) 2014 Karthik. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawCircleAtPoint:(CGPoint)centerPoint withRadius:(int)radius inContext:(CGContextRef)context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}

#define DEFAULT_SCALE 0.90

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    // draw face (Circle)
    
    CGPoint midPoint;
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    CGFloat size = self.bounds.size.width/2;
    
    if(self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height/2;
    size *= DEFAULT_SCALE;
    
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor]setStroke];
    
    [self drawCircleAtPoint:midPoint withRadius:size inContext:context];
    
    // draw eyes (2 circle)
    
#define EYE_H 0.35
#define EYE_V 0.35
#define EYE_RADIUS 0.10
    
    CGPoint eyePoint;
    eyePoint.x = midPoint.x - size * EYE_H;
    eyePoint.y = midPoint.y - size * EYE_V;
    
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];

    eyePoint.x = midPoint.x + size * EYE_H;

    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context];

    // no nose
    
#define MOUTH_H 0.45
#define MOUTH_V 0.35
#define MOUTH_SMILE 0.25
    
    CGPoint mouthStart;
    mouthStart.x = midPoint.x - size * MOUTH_H;
    mouthStart.y = midPoint.y + size * MOUTH_V;
    CGPoint mouthEnd = mouthStart;
    mouthEnd.x = midPoint.x + size * MOUTH_H;
    CGPoint controlPoint1 = mouthStart;
    controlPoint1.x += MOUTH_H * size * 2/3;
    CGPoint controlPoint2 = mouthEnd;
    controlPoint2.x -= MOUTH_H * size * 2/3;
    
    float smile = 1;
    
    CGFloat smileOffset = MOUTH_SMILE * size * smile;
    controlPoint1.y += smileOffset;
    controlPoint2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(context, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, mouthEnd.x, mouthEnd.y);
    CGContextStrokePath(context);
    
    // draw mouth 
    
}

@end
