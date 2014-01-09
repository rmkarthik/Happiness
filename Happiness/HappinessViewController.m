//
//  HappinessViewController.m
//  Happiness
//
//  Created by Karthik on 1/9/14.
//  Copyright (c) 2014 Karthik. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController()
@property (nonatomic, weak) IBOutlet FaceView *faceview;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceview = _faceview;

-(void)setHappiness:(int)happiness {
    _happiness = happiness;
    [self.faceview setNeedsDisplay];
}

-(BOOL)shouldAutorotate {
    return YES;
}
@end
