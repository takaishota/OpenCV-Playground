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
-(UIImage *)convertToGrayScaleFrom:(UIImage *)image {
    cv::Mat convertedImage;
    UIImageToMat(image, convertedImage);
    cv::cvtColor(convertedImage, convertedImage, cv::COLOR_RGB2GRAY);
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
    cv::cvtColor(grayImage, grayImage, cv::COLOR_RGB2GRAY);
    cv::threshold(grayImage, thresholdImage, thresh, 255, cv::THRESH_BINARY);
    cv::cvtColor(thresholdImage, thresholdImage, cv::COLOR_GRAY2RGB);
    return MatToUIImage(thresholdImage);
}

-(UIImage *)extractColor:(NSInteger)hue fromImage:(UIImage *)image {
    int H_MIN = (int) hue - 10;
    int H_MAX = (int) hue + 10;
    int S_MIN = 100;
    int S_MAX = 255;
    int V_MIN = 100;
    int V_MAX = 255;

    cv::Mat originalImage, hsvImage, maskImage, maskedImage;
    UIImageToMat(image, originalImage);
    cv::cvtColor(originalImage, hsvImage, cv::COLOR_RGB2HSV);

    cv::Scalar lower = cv::Scalar(H_MIN, S_MIN, V_MIN);
    cv::Scalar upper = cv::Scalar(H_MAX, S_MAX, V_MAX);
    cv::inRange(hsvImage, lower, upper, maskImage);
    originalImage.copyTo(maskedImage, maskImage);

    return MatToUIImage(maskedImage);
}

-(UIImage *)removeColor:(NSInteger)hue fromImage:(UIImage *)image {
    int H_MIN = (int) hue - 20;
    int H_MAX = (int) hue + 20;
    int S_MIN = 50;
    int S_MAX = 255;
    int V_MIN = 50;
    int V_MAX = 255;

    cv::Mat originalImage, hsvImage, maskInverse, mask, maskRGB, maskedImage;
    UIImageToMat(image, originalImage);
    cv::cvtColor(originalImage, hsvImage, cv::COLOR_RGB2HSV);
    
    cv::Scalar lower = cv::Scalar(H_MIN, S_MIN, V_MIN);
    cv::Scalar upper = cv::Scalar(H_MAX, S_MAX, V_MAX);
    cv::inRange(hsvImage, lower, upper, maskInverse);

    cv::bitwise_not(maskInverse, mask);
    cv::bitwise_and(originalImage, originalImage, maskedImage, mask);

    return MatToUIImage(maskedImage);
}
@end
