#import "KTPhotoView+SDWebImage.h"
#import "SDWebImageManager.h"

@implementation KTPhotoView (SDWebImage)

- (void)setImageWithURL:(NSURL *)url {
  [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
  SDWebImageManager *manager = [SDWebImageManager sharedManager];
  
  // Remove in progress downloader from queue
  [manager cancelForDelegate:self];
  
  UIImage *cachedImage = [manager imageWithURL:url];
  
  if (cachedImage) {
    [self setImage:cachedImage];
  }
  else {
    if (placeholder) {
      [self setImage:placeholder];
    }
    
    [manager downloadWithURL:url delegate:self];
  }
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image {
  // TODO: What if the same view shows another image when this completes?
  // Or does cancelForDelegate cover that?
  [self setImage:image];
}

@end