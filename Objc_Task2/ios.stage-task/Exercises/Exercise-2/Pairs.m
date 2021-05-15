#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger numberOfPairs = 0;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    for (NSNumber *numberA in sortedArray) {
        NSUInteger indexOfNumberB = [sortedArray indexOfObject:numberA] + 1;
        for (; indexOfNumberB < sortedArray.count; indexOfNumberB++) {
            NSNumber *numberB = [sortedArray objectAtIndex:indexOfNumberB];
            if ([numberA intValue] == [numberB intValue] - [number intValue]) {
                numberOfPairs++;
            }
        }
    }
    
    return numberOfPairs;
}

@end
