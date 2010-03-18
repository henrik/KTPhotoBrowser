//
//  KTThumbView.m
//  KTPhotoBrowser
//
//  Created by Kirby Turner on 2/3/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "KTThumbView.h"
#import <QuartzCore/QuartzCore.h>


@implementation KTThumbView

@synthesize delegate = delegate_;

- (void)dealloc {
   [super dealloc];
}

- (id)initWithFrame:(CGRect)frame andHasBorder:(BOOL)hasBorder {
   if (self = [super initWithFrame:frame]) {

     [self addTarget:self
               action:@selector(didTouch:)
     forControlEvents:UIControlEventTouchUpInside];

     if (hasBorder) {
       self.layer.borderColor = [UIColor colorWithWhite:0.85 alpha:1.0].CGColor;
       self.layer.borderWidth = 1;
     }

   }
   return self;
}

- (void)didTouch:(id)sender {
   if (delegate_ && [delegate_ respondsToSelector:@selector(didSelectThumbAtIndex:)]) {
      [delegate_ didSelectThumbAtIndex:[self tag]];
   }
}

- (void)setThumbImage:(UIImage *)newImage {
  [self setImage:newImage forState:UIControlStateNormal];
}

@end
