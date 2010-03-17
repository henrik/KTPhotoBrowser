//
//  AsyncPhotos.h
//  Sample
//
//  Created by Henrik Nyh on 2010-03-18.
//  MIT license.
//

#import <Foundation/Foundation.h>
#import "KTPhotoBrowserDataSource.h"

@interface AsyncPhotos : NSObject <KTPhotoBrowserDataSource> {
  NSArray* _thumbURLs;
  NSArray* _bigURLs;
}

@end
