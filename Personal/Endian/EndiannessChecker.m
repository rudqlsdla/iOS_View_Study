//
//  EndiannessChecker.m
//  iOS_View_Study
//
//  Created by 임경빈 on 3/20/25.
//

#import "EndiannessChecker.h"

@implementation EndiannessChecker

+ (NSString *)checkEndianness {
  int num = 0x12345678;
  unsigned char *ptr = (unsigned char*)&num;
  
  NSLog(@"Stored bytes: %02X %02X %02X %02X", ptr[0], ptr[1], ptr[2], ptr[3]);
  
  if (ptr[0] == 0x78) {
    return @"LITTLE ENDIAN";  // 78 56 34 12 (LSB 먼저)
  } else if (ptr[0] == 0x12) {
    return @"BIG ENDIAN";  // 12 34 56 78 (MSB 먼저)
  } else {
    return @"UNKNOWN ENDIAN";  // 예상치 못한 결과
  }
}

@end
