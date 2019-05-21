//
//  FourthViewController.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 28/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

//This controller class 
#import <UIKit/UIKit.h>
#import "Resistor.h"
#import "ResistorValue.h"

//This class is a details page for the resistor objects in the table view controller
@interface FourthViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ResistorSeriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *ResistorValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *ResistorOrderCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ResistorPriceLabel;

//First four colours of the 5 band colour scheme
@property (weak, nonatomic) IBOutlet UILabel *colourLabel;
@property (weak, nonatomic) IBOutlet UILabel *colourLabel2;
@property (weak, nonatomic) IBOutlet UILabel *colourLabel3;
@property (weak, nonatomic) IBOutlet UILabel *colourLabelMultiplier;


//Resistor values shown in label
@property (weak, nonatomic) IBOutlet UILabel *KResistorValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *MResistorValueLabel;


//First four colours of the 5 band colour scheme
@property (weak, nonatomic) IBOutlet UILabel *KcolourLabel;
@property (weak, nonatomic) IBOutlet UILabel *KcolourLabel2;
@property (weak, nonatomic) IBOutlet UILabel *KcolourLabel3;
@property (weak, nonatomic) IBOutlet UILabel *KcolourLabelMultiplier;

//First four colours of the 5 band colour scheme
@property (weak, nonatomic) IBOutlet UILabel *McolourLabel;
@property (weak, nonatomic) IBOutlet UILabel *McolourLabel2;
@property (weak, nonatomic) IBOutlet UILabel *McolourLabel3;
@property (weak, nonatomic) IBOutlet UILabel *McolourLabelMultiplier;

//Tolerance colours of the 5 band colour scheme
@property (weak, nonatomic) IBOutlet UILabel *toleralceLabel1;
@property (weak, nonatomic) IBOutlet UILabel *toleranceLabel2;
@property (weak, nonatomic) IBOutlet UILabel *toleranceLabel3;


@property (strong, nonatomic) Resistor *resistor;
@property (strong, nonatomic) ResistorValue *resistorValue;
@end
