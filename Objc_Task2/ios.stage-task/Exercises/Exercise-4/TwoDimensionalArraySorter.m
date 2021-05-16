#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    BOOL hasStringsSubarrays = NO;
    BOOL hasNumberSubarrays = NO;
    BOOL hasMixedSubarrays = NO;
    NSMutableArray *stringsArray = [NSMutableArray new];
    NSMutableArray *numbersArray = [NSMutableArray new];
    
    if (array == nil || array.count == 0 ) {
        return @[];
    } else {
        for (NSArray *subarray in array) {
            if ([subarray isKindOfClass:[NSArray class]]) {
                for (id object in subarray) {
                    if ([object isKindOfClass:[NSString class]]) {
                        hasStringsSubarrays = YES;
                        [stringsArray addObject:object];
                    }
                    if ([object isKindOfClass:[NSNumber class]]) {
                        hasNumberSubarrays = YES;
                        [numbersArray addObject:object];
                    }
                    if (hasStringsSubarrays && hasNumberSubarrays) {
                        hasMixedSubarrays = YES;
                    }
                }
            } else {
                return @[];
            }
        }
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        NSSortDescriptor *sortDescendingDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
        NSArray *sortedStringsArray = [stringsArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        NSArray *sortedDescendingStringsArray = [stringsArray sortedArrayUsingDescriptors:@[sortDescendingDescriptor]];
        NSArray *sortedNumbersArray = [numbersArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        if (hasStringsSubarrays) {
            return sortedStringsArray;
        } else if (hasNumberSubarrays) {
            return sortedNumbersArray;
        } else if (hasMixedSubarrays) {
            NSArray *mixedArray = @[sortedNumbersArray, sortedDescendingStringsArray];
            return mixedArray;
        }
    }
    
    
    
    return @[];
}

@end
