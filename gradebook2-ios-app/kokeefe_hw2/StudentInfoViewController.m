//
//  StudentInfoViewController.m
//  kokeefe_hw2
//
//  Created by Kayli O'Keefe on 3/3/19.
//  Copyright © 2019 Kayli O'Keefe. All rights reserved.
//

#import "StudentInfoViewController.h"
#import "ViewController.h"
@interface StudentInfoViewController ()


@end

@implementation StudentInfoViewController

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.studentImage setContentMode:UIViewContentModeScaleAspectFit];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController *VC = (ViewController *)self.presentingViewController;
    [VC backToUpdateInfo];
}
#pragma mark - Navigation




@end
