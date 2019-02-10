//
//  OpenCVWrapper.h
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/29.
//  Copyright © 2019年 takaishota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject
-(NSString *)openCVVersionString;
-(UIImage*)convertToGrayScaleFrom:(UIImage *)image;
-(UIImage *)meanFrom:(UIImage *)image;
-(UIImage *)thresholdFrom:(UIImage *)image withThresh:(NSInteger)thresh;
-(UIImage *)extractColor:(NSInteger)hue fromImage:(UIImage *)image;
@end
