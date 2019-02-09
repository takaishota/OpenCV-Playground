//
//  OpenCVWrapper.m
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/29.
//  Copyright © 2019年 takaishota. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"

@implementation OpenCVWrapper
-(NSString *)openCVVersionString {
    return [NSString stringWithFormat: @"OpenCV Version %s", CV_VERSION];
}
-(UIImage *)convertToGrayScaleFrom:(UIImage*)image {
    cv::Mat convertedImage;
    UIImageToMat(image, convertedImage);
    cv::cvtColor(convertedImage, convertedImage, CV_BGR2GRAY);
    return MatToUIImage(convertedImage);
}
-(UIImage *)meanFrom:(UIImage *)image {
    cv::Mat mat;
    UIImageToMat(image, mat);
    cv::Scalar scalar = cv::mean(mat);
    mat.setTo(scalar);
    return MatToUIImage(mat);
}
-(UIImage *)thresholdFrom:(UIImage *)image withThresh:(NSInteger)thresh {
    cv::Mat grayImage;
    cv::Mat thresholdImage;
    UIImageToMat(image, grayImage);
    cv::cvtColor(grayImage, grayImage, CV_BGR2GRAY);
    cv::threshold(grayImage, thresholdImage, thresh, 255, cv::THRESH_BINARY);
    cv::cvtColor(thresholdImage, thresholdImage, cv::COLOR_GRAY2RGB);
    return MatToUIImage(thresholdImage);
}
@end
