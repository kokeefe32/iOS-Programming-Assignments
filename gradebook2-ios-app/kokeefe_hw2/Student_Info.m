//
//  Student_Info.m
//  kokeefe_hw2
//
//  Created by Kayli O'Keefe on 3/3/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import "Student_Info.h"

@implementation Student_Info

- (id) init{
    if(self=[super init]){
        
    }
    return self;

}


-(void) setAddress:(NSString *) address{
    _address = address;
}
// set midterm score
-(void) setMidterm:(float) score{
    _midterm_exam = score;
}
// set final exam score
-(void) setFinal:(float) score{
    _final_exam = score;
}
// set hw1 score
-(void) setHW1:(int) score{
    _hw1 = score;
}
// set hw2 score
-(void) setHW2:(int)score{
    _hw2 = score;
}
// set hw3 score
-(void) setHW3:(int)score{
    _hw3 = score;
}


@end
