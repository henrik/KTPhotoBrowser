//
//  AsyncPhotos.m
//  Sample
//
//  Created by Henrik Nyh on 2010-03-18.
//  MIT license.
//

#import "AsyncPhotos.h"


@implementation AsyncPhotos


#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
  return [_thumbURLs count];
}

// These are set immediately, then eventually replaced.

- (UIImage *)imageAtIndex:(NSInteger)index {
  return [UIImage imageNamed:@"placeholder.png"];
}

- (UIImage *)thumbImageAtIndex:(NSInteger)index {
  return [UIImage imageNamed:@"placeholder.png"];
}

// These are set asychronously.

- (NSString *)urlStringAtIndex:(NSInteger)index {
  return [_bigURLs objectAtIndex:index];
}
- (NSString *)thumbUrlStringAtIndex:(NSInteger)index {
  return [_thumbURLs objectAtIndex:index];
}


#pragma mark -
#pragma mark Lifecycle

- (id)init {
  if (self = [super init]) {
    _thumbURLs = [[NSArray arrayWithObjects:
                   @"http://www.auktionskompaniet.com/uploaded_images/0237/2117/AK_7386_listing.JPG",
                   @"http://www.auktionskompaniet.com/uploaded_images/0237/2657/AK_7400_listing.JPG",
                   @"http://www.auktionskompaniet.com/uploaded_images/0238/0961/AK_7599_listing.JPG",
                   @"http://www.auktionskompaniet.com/uploaded_images/0238/0923/AK_7605_listing.JPG",
                   nil] retain];
    
    _bigURLs = [[NSArray arrayWithObjects:
                 @"http://www.auktionskompaniet.com/uploaded_images/0237/2117/AK_7386_object.JPG",
                 @"http://www.auktionskompaniet.com/uploaded_images/0237/2657/AK_7400_object.JPG",
                 @"http://www.auktionskompaniet.com/uploaded_images/0238/0961/AK_7599_object.JPG",
                 @"http://www.auktionskompaniet.com/uploaded_images/0238/0923/AK_7605_object.JPG",
                 nil] retain];    
  }
  return self;
}

- (void)dealloc {
  [_thumbURLs release];
  [_bigURLs release];
  [super dealloc];
}


@end
