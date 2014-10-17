//
//  ZIncrementlyImage.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-16.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZIncrementlyImage.h"

#import <ImageIO/ImageIO.h>
#import <CoreFoundation/CoreFoundation.h>

@interface ZIncrementlyImage () {
    NSURLRequest    *_request;
    NSURLConnection *_conn;
    
    CGImageSourceRef _incrementallyImgSource;
    
    NSMutableData   *_recieveData;
    long long       _expectedLeght;
    bool            _isLoadFinished;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *thumbImage;

@end

@implementation ZIncrementlyImage

@synthesize imageURL = _imageURL;
@synthesize image    = _image;
@synthesize thumbImage = _thumbImage;

- (id)initWithURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {
        _imageURL = imageURL;
        
        _request = [[NSURLRequest alloc] initWithURL:_imageURL];
        _conn    = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
        
        _incrementallyImgSource = CGImageSourceCreateIncremental(NULL);
        
        _recieveData = [[NSMutableData alloc] init];
        _isLoadFinished = false;
    }
    
    return self;
}

#pragma mark -
#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _expectedLeght = response.expectedContentLength;
    ZLOG(@"expected Length: %lld", _expectedLeght);
    
    NSString *mimeType = response.MIMEType;
    NSLog(@"MIME TYPE %@", mimeType);
    
    NSArray *arr = [mimeType componentsSeparatedByString:@"/"];
    if (arr.count < 1 || ![[arr objectAtIndex:0] isEqual:@"image"]) {
        ZLOG(@"not a image url");
        [connection cancel];
        _conn = nil;
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    ZLOG(@"Connection %@ error, error info: %@", connection, error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    ZLOG(@"Connection Loading Finished!!!");
    
    // if download image data not complete, create final image
    if (!_isLoadFinished) {
        CGImageSourceUpdateData(_incrementallyImgSource, (CFDataRef)_recieveData, _isLoadFinished);
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(_incrementallyImgSource, 0, NULL);
        self.image = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_recieveData appendData:data];
    
    _isLoadFinished = false;
    if (_expectedLeght == _recieveData.length) {
        _isLoadFinished = true;
    }
    
    CGImageSourceUpdateData(_incrementallyImgSource, (CFDataRef)_recieveData, _isLoadFinished);
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(_incrementallyImgSource, 0, NULL);
    self.image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
}

@end

