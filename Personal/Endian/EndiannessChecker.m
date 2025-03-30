//
//  EndiannessChecker.m
//  iOS_View_Study
//
//  Created by 임경빈 on 3/20/25.
//

#import "EndiannessChecker.h"

@implementation EndiannessChecker

+ (NSString *)checkEndianness {
  int num = 1;
  char *ptr = (char*)&num;
  
  if (*ptr == 1) {
    return @"LITTLE ENDIAN";
  } else {
    return @"BIG ENDIAN";
  }
}

@end
