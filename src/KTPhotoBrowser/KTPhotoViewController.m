//
//  KTPhotoViewController.m
//  KTPhotoBrowser
//
//  Created by Kirby Turner on 2/3/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "KTPhotoViewController.h"
#import "KTPhotoBrowserDataSource.h"
#import "KTPhotoScrollViewController.h"
#import "KTPhotoView.h"
#import "KTPhotoView+SDWebImage.h"


@implementation KTPhotoViewController

@synthesize photoIndex = photoIndex_;
@synthesize scroller = scroller_;

- (void)dealloc {
   [imageView_ release], imageView_ = nil;
   [queue_ release], queue_ = nil;
   
   [super dealloc];
}

- (id)initWithDataSource:(id <KTPhotoBrowserDataSource>)dataSource {
   if (self = [super init]) {
      dataSource_ = dataSource;
      queue_ = [[NSOperationQueue alloc] init];

      // Make sure to set wantsFullScreenLayout or the photo
      // will not display behind the status bar.
      [self setWantsFullScreenLayout:YES];
   }
   return self;
}

- (void)loadView {
   [super loadView];
   
   CGRect frame = [[UIScreen mainScreen] bounds];
   KTPhotoView *newView = [[KTPhotoView alloc] initWithFrame:frame];
   [newView setBackgroundColor:[UIColor clearColor]];

   [[self view] addSubview:newView];
   
   imageView_ = newView;
   [imageView_ retain];
   
   [newView release];
}

- (void)setPhotoIndex:(NSInteger)newPageIndex {
   photoIndex_ = newPageIndex;
   
   if (dataSource_ && photoIndex_ >=0 && photoIndex_ < [dataSource_ numberOfPhotos]) {
      // We set the image in a separate thread to allow the runloop to
      // complete the animation needed by the scroll view during scrolling.
      NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                              selector:@selector(setImage:)
                                                                                object:nil];
      [queue_ addOperation:operation];
      [operation release];
   }
}

- (void)setImage:(id)data {
   if (photoIndex_ < [dataSource_ numberOfPhotos]) {
      UIImage *image = [dataSource_ imageAtIndex:photoIndex_];
     
      if ([dataSource_ respondsToSelector:@selector(urlStringAtIndex:)]) {
        NSURL *url = [NSURL URLWithString:[dataSource_ urlStringAtIndex:photoIndex_]];
        [imageView_ setImageWithURL:url placeholderImage:image];
      } else {
        [imageView_ setImage:image];
      }
   }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
   if (scroller_) {
      [scroller_ toggleChromeDisplay];
   }
}

@end
