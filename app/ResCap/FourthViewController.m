//
//  FourthViewController.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 28/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import "FourthViewController.h"



@interface FourthViewController ()

@end

@implementation FourthViewController

//All operations of this class are peformed in the viewdidlOAD METHOD
//The class populates the details view with the folowing
//Series type
//Resistor value (K and M)
//Resistor colour code (K and M)
//ordercode
//price
- (void)viewDidLoad {
    [super viewDidLoad];
    self.resistorValue = [[ResistorValue alloc] init];
    
    int tempValue = self.resistor.numericValue*100;
    self.ResistorSeriesLabel.text = self.resistor.series;
    
    
    //Sets the tolerance band colours for resistor values (one value dependent on the series
    if ([self.ResistorSeriesLabel.text isEqualToString:@"E12"]){
        self.toleralceLabel1.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:7];
        self.toleranceLabel2.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:7];
        self.toleranceLabel3.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:7];
    }else if([self.ResistorSeriesLabel.text isEqualToString:@"E24"]){
        self.toleralceLabel1.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:6];
        self.toleranceLabel2.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:6];
        self.toleranceLabel3.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:6];
    }else if([self.ResistorSeriesLabel.text isEqualToString:@"E48"]){
        self.toleralceLabel1.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:1];
        self.toleranceLabel2.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:1];
        self.toleranceLabel3.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:1];
    }else{
        self.toleralceLabel1.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:0];
        self.toleranceLabel2.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:0];
        self.toleranceLabel3.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:0];
    }
    
    //Return resistor values in x1, x1000 and x1000000
    self.ResistorValueLabel.text = [NSString stringWithFormat:@"%.1fΩ", (self.resistor.numericValue*10)];
    self.KResistorValueLabel.text = [NSString stringWithFormat:@"%.1fkΩ", (self.resistor.numericValue*100)];
    self.MResistorValueLabel.text = [NSString stringWithFormat:@"%.1fMΩ", (self.resistor.numericValue*100)];
    
    

    self.ResistorOrderCodeLabel.text = [NSString stringWithFormat:@"%1ld", (long) self.resistor.ordercode];
    self.ResistorPriceLabel.text = [NSString stringWithFormat:@"£ %.1f", self.resistor.price];

    if ((tempValue%10) > 0){
        self.colourLabelMultiplier.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:10];
    }else{
        self.colourLabelMultiplier.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:0];
    }
    self.KcolourLabelMultiplier.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:3];
    self.McolourLabelMultiplier.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:7];
 
    int calcValue = tempValue;
    int thirdSig = calcValue % 10;
    calcValue /=10;
    int secondSig = calcValue % 10;
    calcValue /=10;
    int firstSig = calcValue % 10;
    
    //set the colour band scheme for the significant figures
    if ((tempValue%10) > 0){
    self.colourLabel.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:firstSig];
    self.colourLabel2.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:secondSig];
    self.colourLabel3.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:thirdSig];
    }else{
        self.colourLabel.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:0];
        self.colourLabel2.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:firstSig];
        self.colourLabel3.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:secondSig];
    }
    
    //The colour labels are broken into 3 magnitudes in the detail page
    self.KcolourLabel.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:firstSig];
    self.KcolourLabel2.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:secondSig];
    self.KcolourLabel3.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:thirdSig];
    self.McolourLabel.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:firstSig];
    self.McolourLabel2.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:secondSig];
    self.McolourLabel3.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:thirdSig];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
