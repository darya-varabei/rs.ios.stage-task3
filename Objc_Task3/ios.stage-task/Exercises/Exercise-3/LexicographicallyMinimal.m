#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *firstString = [NSMutableString stringWithString:string1];
    NSMutableString *secondString = [NSMutableString stringWithString:string2];
    NSMutableString *resultString = [NSMutableString new];
    
    
    NSUInteger firstCounter = firstString.length;
    NSUInteger secondCounter = secondString.length;
    NSUInteger summ = firstCounter + secondCounter;
    
    if(firstCounter == 0 && secondCounter == 0){
        return nil;
    }
    
    while(summ != 0){
        
        if(firstString.length == 0 && secondString.length != 0){
            [resultString appendFormat:@"%c", [secondString characterAtIndex:0]];
            [secondString deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        
        else if(firstString.length != 0 && secondString.length == 0){
            [resultString appendFormat:@"%c", [firstString characterAtIndex:0]];
            [firstString deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        
            else if ([firstString UTF8String][0] <= [secondString UTF8String][0]){
            [resultString appendFormat:@"%c", [firstString characterAtIndex:0]];
            [firstString deleteCharactersInRange:NSMakeRange(0, 1)];
            }
        
            else{
            [resultString appendFormat:@"%c", [secondString characterAtIndex:0]];
            [secondString deleteCharactersInRange:NSMakeRange(0, 1)];
            }
        
        summ = summ - 1;
        
    }
    return resultString;
}

@end
