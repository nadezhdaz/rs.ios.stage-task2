#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSString *result = [NSString new];
    NSInteger numbersArrayCount = numbersArray.count <= 4 ? numbersArray.count : 4;
    NSMutableArray *ipv4Array = [NSMutableArray new];
    
    if (numbersArray == nil || numbersArray.count == 0) {
        return result;
    } else {
        for (int i = 0; i < numbersArrayCount; i++) {
            NSInteger element = [numbersArray[i] integerValue];
            if (i > numbersArrayCount) {
                [ipv4Array addObject:@0];
            } else if (element > 255) {
                result = @"The numbers in the input array can be in the range from 0 to 255.";
                return result;
            } else if (element < 0){
                result = @"Negative numbers are not valid for input.";
                return result;
            } else {
                [ipv4Array addObject:@(element)];
            }
        }
        
        while (numbersArrayCount < 4) {
            [ipv4Array addObject:@0];
            numbersArrayCount++;
        }
        
        result = [ipv4Array componentsJoinedByString:@"."];
    }
    
    return result;
}

@end
