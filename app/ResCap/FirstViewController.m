//
//  FirstViewController.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

//This class controls the functionality of the 5 band resistor calculator view controller
#import "FirstViewController.h"

@interface FirstViewController (){
    NSArray *multi;
    NSArray *tol;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //string values for Picker text
    multi = @[@"1", @"10", @"100", @"1K", @"10K", @"100k", @"1M", @"10M", @"-", @"-", @"0.1", @"0.01"];
    tol = @[@"±1%", @"±2%", @"±0.5%", @"±0.25%", @"±0.1%", @"±0.05%", @"±5%", @"±10%", @"±20%"];
    
    self.resistorValue = [[ResistorValue alloc] init];
    //sets the number of band to allow calculation for 5 band in the ResistorValue method.
    self.resistorValue.numberOfBands = 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//this method returns number of components in picker
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

//Returns number of rows in each component of the picker
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows;
    if (component== 0) { //first significant figure
        rows = 10;
    }else if (component == 1){ //second significant figure
        rows = 10;
    }else if (component == 2){ //third significant figure
        rows = 10;
    }else if (component == 3){ //multiplier
        rows = [self.resistorValue.bandColorArray count];
    }else{ //tolerance
        rows = [self.resistorValue.toleranceColorArray count];
    }
    return rows;
}

//This method returns the colour of the picker components (corresponds with band colour)
//It also sets texts in each component of the picker
- (UILabel *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *band = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    if (component == 3){
        band.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"x%@", [multi objectAtIndex:row]];
        band.textAlignment = NSTextAlignmentCenter;
        if(row == 0){       //turn text in picker white at first row
            band.textColor = [UIColor whiteColor];
            band.textAlignment = NSTextAlignmentCenter;   //centre text
        }
    }else if (component == 4){
        band.backgroundColor = [self.resistorValue.toleranceColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"%@", [tol objectAtIndex:row]];
        band.textAlignment = NSTextAlignmentCenter;
    }else {
        band.backgroundColor = [self.resistorValue.bandColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"%ld", (long)row];
        band.textAlignment = NSTextAlignmentCenter;
        if(row == 0){
            band.textColor = [UIColor whiteColor];
            band.textAlignment = NSTextAlignmentCenter;
        }
    }
    return band;
}

//This method detects the position of the picker and assigns the corresponding values for the resistor
//It then feeds the vaue back to the user via a label with format "1.0 (k,M) (Ω)"
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //Assing significant figure values, multipliers and tolerance via
    //picker components position set by user
    self.resistorValue.firstSignificantFigure = [self.ResPicker selectedRowInComponent:0];
    self.resistorValue.secondSignificantFigure = [self.ResPicker selectedRowInComponent:1];
    self.resistorValue.thirdSignificantFigure = [self.ResPicker selectedRowInComponent:2];
    self.resistorValue.multiplierIndex = [self.ResPicker selectedRowInComponent:3];
    self.resistorValue.toleranceIndex = [self.ResPicker selectedRowInComponent:4];
    
    double value = self.resistorValue.value;
    double tolerance = self.resistorValue.tolerance;
    
    //The output values are divided to give 2 decimal point values with the magnitude of the order
    //attached (eg 10000Ω to 10.0kΩ)
    if (self.resistorValue.multiplierIndex == 8 || self.resistorValue.multiplierIndex == 9){
        self.resistorLabel.text = [NSString stringWithFormat:@"out of scope"]; //check for values about 999MΩ
    }else if(value >= 1000000){
        self.resistorLabel.text = [NSString stringWithFormat:@"%.2fMΩ (±%.2f %%)", value/1000000, tolerance];
        [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
        [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
    }else if(value >= 1000){
        self.resistorLabel.text = [NSString stringWithFormat:@"%.2fkΩ (±%.2f %%)", value/1000, tolerance];
        [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
        [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
    }else {
        self.resistorLabel.text = [NSString stringWithFormat:@"%.2fΩ (±%.2f %%)", value, tolerance];
        [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
        [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
    }
}

//This method transitions to a web view with the values of the current resistor
//as a searchable string.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    double value = self.resistorValue.value;
    NSString *fullValue;
    NSString *formatedValue;
    if(value >= 1000000){
        fullValue = [NSString stringWithFormat:@"%.1fM ohm resistor", value/1000000];
    }else if(value >= 1000){
        fullValue = [NSString stringWithFormat:@"%.1fk ohm resistor", value/1000];
    }else {
        fullValue = [NSString stringWithFormat:@"%.1f ohm resistor", value];
    }
    formatedValue = [fullValue stringByReplacingOccurrencesOfString:@"." withString:@"%2E"];
    formatedValue = [formatedValue stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    //detecting bad string characters and converting to searchable string characters
    
    
    WebViewController *dvc = [segue destinationViewController]; //creates view controller instance to pass string
    dvc.getUrl = [NSString stringWithFormat:@"https://www.ebay.co.uk/sch/%@", formatedValue];
}

@end
