//
//  main.m
//  hw1
//
//  Created by Kayli O'Keefe on 2/11/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student_Info.h"

NSMutableDictionary *course;

// Given a name and address, a student to the course
Boolean Add_Student(NSString *name, NSString *address){
    // initialize dictionary if adding student for the first time
    if (course == nil){
        course = [[NSMutableDictionary alloc] init];
    }
    Student_Info *student = [[Student_Info alloc] init:name address: address];
    if([course objectForKey:name]){
        NSLog(@"Key already exists. Failed to add student to dictionary");
        return false;
    }else{
        course[name] = student;
    }
    return true;
} // end Add_Student

// Given a name, delete student from the course (if they exist)
Boolean Delete_Student(NSString *name){
    if (course == nil || ![course objectForKey:name]){
        NSLog(@"Error removing student.");
        return false;
    }
    [course removeObjectForKey:name];
    NSLog(@"%@ has been removed.", name);
    return true;
} // end Delete_Student

// Given a name, a string identifying which test, and a score, update student object
Boolean Add_Test(NSString *name, NSString *test, float score){
    if(course == nil || ![course objectForKey:name]){
        NSLog(@"Error. Test is not added");
        return false;
    }
    else if([test isEqualToString:@"midterm"]){
        [[course objectForKey:name] setMidterm:score];
    }
    else if([test isEqualToString:@"final"]){
            [[course objectForKey:name] setFinal:score];
    }
    //NSLog(@"Student %@ 's %@ score has been set to %f", name, test, score);
    return true;
    
} // end Add_Test

// Given a name, a string identifying which hw, and a score, update student object
Boolean Add_HW(NSString *name, NSString *hw, int score){
    if(course == nil || ![course objectForKey:name]){
        NSLog(@"Error. Test is not added");
        return false;
    }
    else if([hw isEqualToString:@"hw1"]){
        [[course objectForKey:name] setHW1:score];
    }
    else if([hw isEqualToString:@"hw2"]){
        [[course objectForKey:name] setHW2:score];
    }
    else if([hw isEqualToString:@"hw3"]){
        [[course objectForKey:name] setHW3:score];
    }
   // NSLog(@"Student %@ 's %@ score has been set to %d", name, hw, score);
    return true;
    
} // end Add_HW

// Print all objects from the dictionary
void Print_Dictionary(){
    if(course == nil){
        NSLog(@"Dictionary is empty. Nothing to print.");
    }
    else{
        for(id key in course){
            id obj = [course objectForKey:key];
            NSLog(@"\nName: %@\n %@\n", key, [obj Print_Object]);
        }
    }
} // end Print_Dictionary()

// Return true if all scores have been set, false otherwise
Boolean Student_Average(NSString* name){
    float avg = [[course objectForKey:name] getAverage];
    if (![[course objectForKey:name] allScoresSet]){
        NSLog(@"Not all scores have been set. %@'s average of %f is inaccurate (scores are initialized to -1).", name, avg);
        return false;
    }
    NSLog(@"%@'s average score is: %f", name, avg);
    return true;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Add students to dictionary
        Add_Student(@"Joan Watson", @"New York");
        Add_Student(@"Nancy Drew", @"River Heights");
        Add_Student(@"Jessica Fletcher", @"Cabot Cove");
        Add_Student(@"Batman", @"Gotham");
      
        
        // Add hw and test scores for students
        Add_Test(@"Joan Watson", @"midterm", 75.0);
        Add_Test(@"Joan Watson", @"final", 90.0);
        Add_HW(@"Joan Watson", @"hw1", 7);
        Add_HW(@"Joan Watson", @"hw2", 9);
        Add_HW(@"Joan Watson", @"hw3", 6);
        
        Add_Test(@"Nancy Drew", @"midterm", 84.5);
        Add_Test(@"Nancy Drew", @"final", 96.3);
        Add_HW(@"Nancy Drew", @"hw1", 2);
        Add_HW(@"Nancy Drew", @"hw2", 10);
        Add_HW(@"Nancy Drew", @"hw3", 9);
        
        Add_Test(@"Jessica Fletcher", @"midterm", 54.0);
        Add_Test(@"Jessica Fletcher", @"final", 85.0);
        Add_HW(@"Jessica Fletcher", @"hw1", 10);
        Add_HW(@"Jessica Fletcher", @"hw2", 6);
        Add_HW(@"Jessica Fletcher", @"hw3", 7);
        
        Add_Test(@"Batman", @"midterm", 46.7);
        Add_Test(@"Batman", @"final", 96.4);
        Add_HW(@"Batman", @"hw1", 8);
        Add_HW(@"Batman", @"hw2", 4);
        Add_HW(@"Batman", @"hw3", 6);
        Print_Dictionary();
        
        // Try adding a test for a student who does not exists
        Add_Test(@"Kayli O'Keefe", @"midterm", 75.0);
        // Try adding a student who already exists
        Add_Student(@"Jessica Fletcher", @"New York");
        
        // Delete some entries
        Delete_Student(@"Nancy Drew");
        Delete_Student(@"Joan Watson");
        
        // Try deleting a student who does not exist
        Delete_Student(@"Miss Marple");
        Print_Dictionary();
        
        // Add some more students
        //Add_Student(@"Billy Bob", @"Buffalo");
        Add_Student(@"Miss Marple", @"St. Mary Mead");
        Add_Student(@"Nora Charles", @"New York");
        
        // Try computing the semester average for a student who's scores aren't set
        Student_Average(@"Miss Marple");
        // Compute student average for students whose scores are set
        Student_Average(@"Jessica Fletcher");
        Student_Average(@"Batman");
        
        // Add some more scores
        Add_Test(@"Miss Marple", @"midterm", 99.9);
        Add_Test(@"Miss Marple", @"final", 100.0);
        Add_HW(@"Miss Marple", @"hw1", 9);
        Add_HW(@"Miss Marple", @"hw2", 9);
        Add_HW(@"Miss Marple", @"hw3", 6);
        
        Add_Test(@"Nora Charles", @"midterm", 88.7);
        Add_Test(@"Nora Charles", @"final", 79.0);
        Add_HW(@"Nora Charles", @"hw1", 3);
        Add_HW(@"Nora Charles", @"hw2", 10);
        Add_HW(@"Nora Charles", @"hw1", 8);

        
        // print out the dictionary yet again
        Print_Dictionary();
     
       
    }
    return 0;
}
