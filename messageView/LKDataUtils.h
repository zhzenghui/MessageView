//
//  LKDataUtils.h
//  CarDaMan
//
//  Created by s c on 12-11-5.
//  Copyright (c) 2012年 LK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMStringEncoding.h"
@interface LKDataUtils : NSObject
+(BOOL)checkEmailWithComponent:(NSString*)email;
+(BOOL)checkEmailWithRegex:(NSString *)email;
+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+(UIImage*)imageWithImage:(UIImage*)image cutToRect:(CGRect)newRect;
+(UIImage*)imageWithImage:(UIImage *)image ratioToSize:(CGSize)newSize;
+(UIImage*)createRoundedRectImage:(UIImage*)image size:(CGSize)size;
+(UIImage*)imageWithImage:(UIImage *)image ratioCompressToSize:(CGSize)newSize;
//当前日期
+(NSString *)currentDate;
//把Date 转换成String
+(NSString*)stringWithDate:(NSDate*)date;
+(NSDate*)dateWithString:(NSString*)str;

+(GTMStringEncoding*)sharedBase64Encoding;
@end
