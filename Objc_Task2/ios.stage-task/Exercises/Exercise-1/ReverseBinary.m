#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 reversed = 0;

        for (NSInteger i = 0; i < 8; i++) {
            if (n % 2 == 1) {
                reversed += pow(2, 7 - i);
            }
            n /= 2;
        }
    
    return reversed;
}
