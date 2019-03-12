//
//  Student_Info.m
//  hw1
//
//  Created by Kayli O'Keefe on 2/11/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import "Student_Info.h"

@implementation Student_Info
-(id) init:(NSString *)name address:(NSString *)addrs{
    if(self = [super init]){
        name = name;
        address = addrs;
        midterm_exam = -1;
        final_exam = -1;
        hw1 = -1;
        hw2 = -1;
        hw3 = -1;
    }
    return self;

    
}

// Getter Methods
// return name
- (NSString *) getName{
    return name;
}
// return address
- (NSString *) getAddress{
    return address;
}
// return midterm score
- (float) getMidterm{
    return midterm_exam;
}
// return final exam score
- (float) getFinal{
    return final_exam;
}
// return hw1 score
- (int) getHW1{
    return hw1;
}
// return hw2 score
- (int) getHW2{
    return hw2;
}
// return hw3 score
- (int) getHW3{
    return hw3;
}

// Return the student average considering 30% midterm, 30% hw, 40% final
- (float) getAverage {
    float hwTotal = (float)[self getHW1] + (float) [self getHW2] + (float)[self getHW3];
    return ([self getMidterm] * 0.3) + ([self getFinal] * .4) + (hwTotal);
    
}

// if any scores are less than 0 return false because they haven't been set
- (Boolean) allScoresSet {
    if([self getHW1] < 0 || [self getHW2] < 0 || [self getHW3] < 0 || [self getMidterm] < 0 || [self getFinal] < 0){
        return false;
    }
    return true;
}



// set student address
-(void) setAddress:(NSString *) addrs{
    address = addrs;
}
// set midterm score
-(void) setMidterm:(float) score{
    midterm_exam = score;
}
// set final exam score
-(void) setFinal:(float) score{
    final_exam = score;
}
// set hw1 score
-(void) setHW1:(int) score{
    hw1 = score;
}
// set hw2 score
-(void) setHW2:(int)score{
    hw2 = score;
}
// set hw3 score
-(void) setHW3:(int)score{
    hw3 = score;
}

// Print student info
-(NSString *) Print_Object{
    return [NSString stringWithFormat: @"address: %@\n midterm: %f\n final: %f\n hw1: %d\n hw2: %d\n hw3: %d\n average: %f\n", address, midterm_exam, final_exam, hw1, hw2, hw3, [self getAverage]] ;
}
@end
