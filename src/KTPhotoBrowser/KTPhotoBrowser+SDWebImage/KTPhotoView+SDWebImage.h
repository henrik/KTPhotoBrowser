#import "KTPhotoView.h"
#import "SDWebImageManagerDelegate.h"

@interface KTPhotoView (SDWebImage) <SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
