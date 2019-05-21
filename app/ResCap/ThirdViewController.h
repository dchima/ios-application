//
//  ThirdViewController.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResistorValue.h"
#import "WebViewController.h"

//This class holds the declarations for the 4 band resistor color calculator view
@interface ThirdViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *Picker;  //resistor picker outlet
@property (strong, nonatomic) ResistorValue *resistorValue;
@property (weak, nonatomic) IBOutlet UILabel *resistorLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchLabel;



@end
