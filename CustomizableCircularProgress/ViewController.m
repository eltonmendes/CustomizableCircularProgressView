//
//  ViewController.m
//  CustomizableCircularProgress
//
//  Created by Elton Mendes Vieira Junior on 2/25/15.
//  Copyright Elton Mendes. All rights reserved.
//

#import "ViewController.h"
#import "CircularProgressView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet CircularProgressView *circularProgressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)updateAction:(id)sender {
    if(self.circularProgressView.currentProgress <= 0.5f){
        [self.circularProgressView changeProgressColor:[UIColor redColor]];
    }
    else if (self.circularProgressView.currentProgress <= 0.7f){
        [self.circularProgressView changeProgressColor:[UIColor yellowColor]];
    }
    else{
        [self.circularProgressView changeProgressColor:[UIColor greenColor]];

    }
    [self.circularProgressView updateProgress:0.1f withDuration:0.3f];
}

@end
