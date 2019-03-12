//
//  Student_Info.h
//  hw1
//
//  Created by Kayli O'Keefe on 2/11/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student_Info : NSObject{
    NSString *name, *address;
    float midterm_exam, final_exam;
    int hw1, hw2, hw3;
    
}

-(id) init: (NSString*) name address: (NSString*) address;



- (NSString *) getName;
- (NSString *) getAddress;
- (float) getMidterm;
- (float) getFinal;
- (int) getHW1;
- (int) getHW2;
- (int) getHW3; 
- (float) getAverage;
- (Boolean) allScoresSet;

-(void) setAddress:(NSString *) addrs;
-(void) setMidterm:(float) score;
-(void) setFinal:(float) score;
-(void) setHW1:(int) score;
-(void) setHW2:(int)score;
-(void) setHW3:(int)score;
-(NSString*) Print_Object;



@end

NS_ASSUME_NONNULL_END
