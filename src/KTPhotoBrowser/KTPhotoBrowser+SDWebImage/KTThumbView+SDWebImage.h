#import "KTThumbView.h"
#import "SDWebImageManagerDelegate.h"

@interface KTThumbView (SDWebImage) <SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
