//
//  KTPhotoBrowserDataSource.h
//  KTPhotoBrowser
//
//  Created by Kirby Turner on 2/7/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol KTPhotoBrowserDataSource <NSObject>
@required
- (NSInteger)numberOfPhotos;
- (UIImage *)imageAtIndex:(NSInteger)index;
- (UIImage *)thumbImageAtIndex:(NSInteger)index;

@optional
- (NSString *)urlStringAtIndex:(NSInteger)index;
- (NSString *)thumbUrlStringAtIndex:(NSInteger)index;
- (void)deleteImageAtIndex:(NSInteger)index;
- (CGSize)thumbSize;
- (NSInteger)thumbsPerRow;
- (BOOL)thumbsHaveBorder;

@end