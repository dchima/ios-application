//
//  SecondViewController.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

//This class controls the functionality of the 4 band capacitor calculator view controller
#import "SecondViewController.h"

@interface SecondViewController (){
    //declare picker test arrays
    NSArray *multi;
    NSArray *tol;
}

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //Initialize string values for Picker text and resstor method
    multi = @[@"1", @"10", @"100", @"1K", @"10K", @"100k", @"1M", @"10M", @"0.01", @"0.1", @"0.1", @"0.01"];
    tol = @[@"±20%", @"±1%", @"±2%", @"±3%", @"±4%", @"±5%", @"80,-20", @"±10%", @"±5%", @"±10%"];
    
    self.capacitorValue = [[CapacitorValue alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//this method returns number of components in picker
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}


//Returns number of rows in each component of the picker
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows;
    if (component == 0){//first significant figure
        rows = 10;
    }else if (component == 1){//second significant figure
        rows = 10;
    }else if (component == 2){ //multiplier
        rows = [self.capacitorValue.bandColorArray count];
    }else{ //tolerance
        rows = [self.capacitorValue.toleranceColorArray count];
    }
    return rows;
}

//This function returns the colour of the picker components (corresponds with band colour)
//It also sets texts in each component of the picker
- (UILabel *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *band = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    if (component == 2){
        band.backgroundColor = [self.capacitorValue.bandColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"x%@", [multi objectAtIndex:row]];
        band.textAlignment = NSTextAlignmentCenter;
        if(row == 0){       //turn text in picker white at first row
            band.textColor = [UIColor whiteColor];
            band.textAlignment = NSTextAlignmentCenter;     //centre text
        }
    }else if (component == 3){
        band.backgroundColor = [self.capacitorValue.toleranceColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"%@", [tol objectAtIndex:row]];
        band.textAlignment = NSTextAlignmentCenter;
        if(row == 0){
            band.textColor = [UIColor whiteColor];
            band.textAlignment = NSTextAlignmentCenter;
        }
    }else{
        band.backgroundColor = [self.capacitorValue.bandColorArray objectAtIndex:row];
        band.text = [NSString stringWithFormat:@"%ld", (long)row];
        band.textAlignment = NSTextAlignmentCenter;
        if(row == 0){
            band.textColor = [UIColor whiteColor];
            band.textAlignment = NSTextAlignmentCenter;
        }
    }
    return band;
}


//This method detects the position of the picker and assigns the corresponding values for the capacitor
//It then feeds the vaue back to the user via a label with format "1.0 (p,n,u) (F) (1.0%)"
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.capacitorValue.firstSignificantFigure = [self.CapPicker selectedRowInComponent:0];
    self.capacitorValue.secondSignificantFigure = [self.CapPicker selectedRowInComponent:1];
    self.capacitorValue.multiplierIndex = [self.CapPicker selectedRowInComponent:2];
    self.capacitorValue.toleranceIndex = [self.CapPicker selectedRowInComponent:3];
    
    double value = self.capacitorValue.value;
    double tolerance = self.capacitorValue.tolerance;
    
    
    //The output values are divided to give 2 decimal point values with the magnitude of the order
    //attached (eg 10000pF to 10.nF)
    if(value >= 1000000){
        if (self.capacitorValue.toleranceIndex == 6){
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fuF(+80%%, -20%%)", value/1000000];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal]; //shows search button
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }else{
        self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fuF(±%.1f%%)", value/1000000, tolerance];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];//shows search button
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }
        
    }else if(value >= 1000){
        if (self.capacitorValue.toleranceIndex == 6){
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fnF(+80%%, -20%%)", value/1000];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];//shows search button
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }else{
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fnF(±%.1f %%)", value/1000, tolerance];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }
        
    }else if(value < 1){
        if (self.capacitorValue.toleranceIndex == 6){
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fpF(+80%%, -20%%)", value];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }else{
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fpF(±%.2f %%)", value, tolerance];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];//shows search button
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }
        
    }else {
        if (self.capacitorValue.toleranceIndex == 6){
            self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fpF(+80%%, -20%%)", value];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }else{
        self.capacitorLabel.text = [NSString stringWithFormat:@"%.1fpF (±%.2f %%)", value, tolerance];
            [self.searchLabel setTitle:@"Search" forState:UIControlStateNormal];
            [self.searchLabel setBackgroundColor:[UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9]];
        }
    }

}

//this method transitions to a web view with the values of the current capacitor
//as a searchable string.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    double value = self.capacitorValue.value;
    NSString *fullValue;
    NSString *formatedValue;
    if(value >= 1000000){
        fullValue = [NSString stringWithFormat:@"%.1fuF Capacitor", value/1000000];
    }else if(value >= 1000){
        fullValue = [NSString stringWithFormat:@"%.1fnF Capacitor", value/1000];
    }else {
        fullValue = [NSString stringWithFormat:@"%.1fpF Capacitor", value];
    }
    
    formatedValue = [fullValue stringByReplacingOccurrencesOfString:@"." withString:@"%2E"];
    formatedValue = [formatedValue stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    //detecting bad string characters and converting to searchable string characters

    WebViewController *dvc = [segue destinationViewController]; //creates view controller instance to pass string
    dvc.getUrl = [NSString stringWithFormat:@"https://www.ebay.co.uk/sch/%@", formatedValue];
}

@end
