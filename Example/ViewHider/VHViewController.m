//
//  VHViewController.m
//  ViewHider
//
//  Created by Roman Temchenko on 10/21/2015.
//  Copyright (c) 2015 Roman Temchenko. All rights reserved.
//

#import "VHViewController.h"

@interface VHViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label1;
@end

@implementation VHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)toggle:(id)sender {
    self.label1.hidden = !self.label1.hidden;
}

@end
