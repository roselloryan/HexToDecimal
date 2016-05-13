//
//  main.m
//  HexToDecimal


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"2e"; //or  11
        
        // build hex values dict to reference
        NSArray *keysArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"a", @"b", @"c", @"d", @"e", @"f", nil];
        NSArray *valuesArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", nil];
        NSDictionary *hexDict = [[NSDictionary alloc]initWithObjects:valuesArray forKeys:keysArray];
        
        NSInteger sumOfHexDigitValues = 0;
        
        // split digits
        NSMutableArray *digitsArray = [[NSMutableArray alloc]init];
        
        NSInteger i =0;
        for (i = 0; i < line.length; i++) {
            NSString *digitString = [NSString stringWithFormat: @"%c", [line characterAtIndex:i]];
            [digitsArray addObject:digitString];
        }
        
        NSInteger k = 0;
        for (k = 0; k < digitsArray.count; k++) {
    
            NSString *hexValueString = [hexDict valueForKey:[digitsArray objectAtIndex:k]];
            NSInteger hexIntegerValue = [hexValueString integerValue];
            
            // build power of 16
            NSInteger powerOfSixteen = 1;
            
            NSInteger j = 0;
            for (j = 0; j < digitsArray.count - k - 1; j++) {
                powerOfSixteen = powerOfSixteen * 16;
            }
            
            sumOfHexDigitValues += powerOfSixteen * hexIntegerValue;
        }
        
        NSLog(@"sumOfHexDigitValues: %ld", sumOfHexDigitValues);
        
    }
    return 0;
}
