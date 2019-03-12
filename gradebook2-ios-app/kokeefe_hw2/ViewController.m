//
//  ViewController.m
//  kokeefe_hw2
//
//  Created by Kayli O'Keefe on 3/3/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import "ViewController.h"
#import "StudentInfoViewController.h"
#import "Student_Info.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressLabel;
@property (weak, nonatomic) IBOutlet UITextField *midtermLabel;
@property (weak, nonatomic) IBOutlet UITextField *finalLabel;
@property (weak, nonatomic) IBOutlet UITextField *hw1Label;
@property (weak, nonatomic) IBOutlet UITextField *hw2Label;
@property (weak, nonatomic) IBOutlet UITextField *hw3Label;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlButton;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;

//@property (strong, atomic) NSMutableArray *studentArray;
@end
int idx = 0;
@implementation ViewController
- (BOOL) canAddStudent:(NSString *)name address:(NSString *)address midterm_exam:(NSString *)midterm_exam final_exam:(NSString *)final_exam hw1:(NSString *)hw1 hw2:(NSString *)hw2 hw3:(NSString *)hw3{
    if([name isEqualToString:@""] || [address isEqualToString:@""] || [midterm_exam isEqualToString:@""] || [final_exam isEqualToString:@""] || [hw1 isEqualToString:@""] || [hw2 isEqualToString:@""] || [hw3 isEqualToString:@""]){
        return NO;
    }
    return YES;
}

- (IBAction)Add_Student:(id)sender {
    if([self canAddStudent:_nameLabel.text address:_addressLabel.text midterm_exam:_midtermLabel.text final_exam:_finalLabel.text hw1:_hw1Label.text hw2:_hw2Label.text hw3:_hw3Label.text]){
        
        Student_Info *newStudent = [[Student_Info new] init];
        newStudent.name = _nameLabel.text;
        newStudent.address = _addressLabel.text;
        newStudent.midterm_exam = _midtermLabel.text.floatValue;
        newStudent.final_exam = _finalLabel.text.floatValue;
        newStudent.hw1 = _hw1Label.text.intValue;
        newStudent.hw2 = _hw2Label.text.intValue;
        newStudent.hw3 = _hw3Label.text.intValue;
        [newStudent setImg:@"blank.png"];
        [_studentArray addObject:newStudent];
        [_segmentedControlButton setSelectedSegmentIndex:0];
        self.view.backgroundColor = [UIColor whiteColor];
        [_errorMessageLabel setAlpha:0];
        [_addStudentButton setAlpha:0];
        [_prevButton setAlpha:1];
        [_nextButton setAlpha:1];
       //s idx += 1;
    }else{
        [_errorMessageLabel setAlpha:1];
        [_addStudentButton setAlpha: 1];
        
    }
    
}

- (void) backToUpdateInfo{
    [_segmentedControlButton setSelectedSegmentIndex:0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_addStudentButton setAlpha:0];
    [_segmentedControlButton setSelectedSegmentIndex:0];
    [_errorMessageLabel setAlpha:0];
    self.studentArray = [[NSMutableArray new] init];
    Student_Info *stud = [[Student_Info new] init];
    
    [stud setName:@"King Richard III"];
    [stud setAddress:@"Leicester Castle, England"];
    [stud setMidterm:72.0];
    [stud setFinal:45];
    [stud setHW1:9];
    [stud setHW2:10];
    [stud setHw3:00];
    [stud setImg:@"richard.png"];
 
    
    
    Student_Info *stud2 = [[Student_Info new] init];
    [stud2 setName:@"Prince Hamlet"];
    [stud2 setAddress:@"Elsinor Castle, Denmark"];
    [stud2 setMidterm:100];
    [stud2 setFinal:0];
    [stud2 setHW1:10];
    [stud2 setHW2:10];
    [stud2 setHw3:10];
    [stud2 setImg:@"hamlet.png"];
    
    
    
    Student_Info *stud3 = [[Student_Info new] init];
    [stud3 setName:@"King Lear"];
    [stud3 setAddress:@"Leicester Castle, England"];
    [stud3 setMidterm:100];
    [stud3 setFinal:22];
    [stud3 setHW1:10];
    [stud3 setHW2:6];
    [stud3 setHw3:0];
    [stud3 setImg:@"lear.png"];
    
    Student_Info *stud4 = [[Student_Info new] init];
    [stud4 setName:@"King Henry VIII"];
    [stud4 setAddress:@"Whitehall Palace, England"];
    [stud4 setMidterm:62];
    [stud4 setFinal:60];
    [stud4 setHW1:7];
    [stud4 setHW2:6];
    [stud4 setHw3:7];
    [stud4 setImg:@"henry.jpeg"];
    
    [_studentArray addObject:stud];
    [_studentArray addObject:stud2];
    [_studentArray addObject:stud3];
    [_studentArray addObject:stud4];
    
  
    
    [self showStudentAtIndex:idx];
  
    
  
   
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)backHome:(UIStoryboardSegue *)segue{
    [_segmentedControlButton setSelectedSegmentIndex:0];
    [_addStudentButton setAlpha:0];
    
    if(idx == 0){
        [_prevButton setEnabled:NO];
        [_nextButton setEnabled:YES];
    }
    else if(idx == _studentArray.count - 1){
        [_prevButton setEnabled:YES];
        [_nextButton setEnabled:NO];
    }
    else{
        [_prevButton setAlpha:1];
        
        [_nextButton setAlpha:1];
        [_prevButton setEnabled:YES];
        [_nextButton setEnabled:YES];
    }
  
}
- (IBAction)selectedSegment:(id)sender {
    if(_segmentedControlButton.selectedSegmentIndex == 0){
        [_addStudentButton setAlpha:0];
        [_nextButton setAlpha:1];
        [_prevButton setAlpha:1];
        self.view.backgroundColor = [UIColor whiteColor];
       // [self showStudentAtIndex:idx];
        
   
        }
    else if(_segmentedControlButton.selectedSegmentIndex == 1){
        StudentInfoViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"studentInfoView"];
        [self showViewController:controller sender:NULL];
        Student_Info *curr = [_studentArray objectAtIndex:idx];
        [controller.studentName setText:curr.name];
        [controller.studentAddress setText:curr.address];
        [controller.studentImage setImage:[UIImage imageNamed:curr.img]];
       
    }
    else if(_segmentedControlButton.selectedSegmentIndex == 2){
        [_addStudentButton setAlpha:1];
        [_nextButton setAlpha:0];
        [_prevButton setAlpha:0];
        self.view.backgroundColor = [UIColor lightGrayColor];
        _nameLabel.text = @"";
        _addressLabel.text = @"";
        _midtermLabel.text = @"";
        _finalLabel.text = @"";
        _hw1Label.text = @"";
        _hw2Label.text=@"";
        _hw3Label.text=@"";
      
    }
   
  
}
- (IBAction)getPrevStudent:(id)sender {
    idx = (idx - 1) % _studentArray.count;
    [self showStudentAtIndex:idx];
}
- (IBAction)getNextStudent:(id)sender {
    idx = (idx + 1) % _studentArray.count;
    [self showStudentAtIndex:idx];
}

- (void) showStudentAtIndex:(int)index{
    if(_studentArray.count == 1){
        [_nextButton setEnabled:NO];
        [_prevButton setEnabled:NO];
    }
    if(_studentArray.count > index && index >= 0){
        if(index == 0){
            [_nextButton setEnabled:YES];
            [_prevButton setEnabled:NO];
        }
        else if(index == _studentArray.count-1){
            [_nextButton setEnabled:NO];
            [_prevButton setEnabled:YES];
        }
        else{
            [_nextButton setEnabled:YES];
            [_prevButton setEnabled:YES];
        }
 
        Student_Info *curr = [_studentArray objectAtIndex:index];
        _nameLabel.text = curr.name;
        _addressLabel.text = curr.address;
        _midtermLabel.text = [NSString stringWithFormat:@"%.1f", curr.midterm_exam];
        _finalLabel.text = [NSString stringWithFormat:@"%.1f", curr.final_exam];
        _hw1Label.text = [NSString stringWithFormat:@"%d", curr.hw1];
        _hw2Label.text = [NSString stringWithFormat:@"%d", curr.hw2];
        _hw3Label.text = [NSString stringWithFormat:@"%d", curr.hw3];
        
       // NSLog(@"index of current student:%d", idx);
        
        
    }
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //
}

@end
