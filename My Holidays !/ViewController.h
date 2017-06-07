//
//  ViewController.h
//  My Holidays !
//
//  Created by Jitendra Kadam on 6/3/17.
//  Copyright © 2017 Jitendra Kadam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)show:(UIButton *)sender;

@end

