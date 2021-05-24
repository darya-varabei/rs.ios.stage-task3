#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSInteger totalCount = 0;
    NSInteger arrayCount = ratingArray.count;
    
    if(ratingArray.count < 3 || ratingArray == nil){
        return 0;
    }
    
    for(int i = 0; i < arrayCount; i++){
        for(int j = i + 1; j < arrayCount; j++){
            if(ratingArray[i].intValue > ratingArray[j].intValue){
                for(int k = j + 1; k < arrayCount; k++){
                    if(ratingArray[j].intValue > ratingArray[k].intValue){
                        totalCount += 1;
                    }
                }
            }
            
            else if(ratingArray[i].intValue < ratingArray[j].intValue){
                for(int k = j + 1; k < arrayCount; k++){
                    if(ratingArray[j].intValue < ratingArray[k].intValue){
                        totalCount += 1;
                    }
                }
            }
        }
    }
    return totalCount;
}

@end
