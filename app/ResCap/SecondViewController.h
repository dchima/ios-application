//
//  SecondViewController.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <UIKit/UIKit.h>

//This class holds the declarations for the 4 band capacitor color calculator view
#import "CapacitorValue.h"
#import "WebViewController.h"

@interface SecondViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *CapPicker;   //picker outlet for the capacitor
@property (strong, nonatomic) CapacitorValue *capacitorValue;   //an instance of the capacitor value clas is called 
@property (weak, nonatomic) IBOutlet UILabel *capacitorLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchLabel;     //search button


@end

