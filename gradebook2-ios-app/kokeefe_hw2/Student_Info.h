//
//  Student_Info.h
//  kokeefe_hw2
//
//  Created by Kayli O'Keefe on 3/3/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student_Info : NSObject

-(id) init;
 

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) float midterm_exam;
@property (nonatomic) float final_exam;
@property (nonatomic) int hw1;
@property (nonatomic) int hw2;
@property  (nonatomic) int hw3;
@property (nonatomic) NSString *img;

-(void) setName: (NSString *) name;
-(void) setAddress:(NSString *) address;
-(void) setMidterm:(float) midterm_exam;
-(void) setFinal:(float) final_exam;
-(void) setHW1:(int) hw1;
-(void) setHW2:(int)hw2;
-(void) setHW3:(int)hw3;
//-(void) setImg: (UIImageView*) img;



@end

NS_ASSUME_NONNULL_END
