//
//  FifthViewController.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 05/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import "FifthViewController.h"

//This class creates an instance of ResistorCalculator to calculate the series and parallel
//values of resistor input values to the view controller
@interface FifthViewController ()

@end

@implementation FifthViewController

//synthesize getter/setter method for input text field properties
@synthesize seriesTextField;
@synthesize parallelTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    //initialize instance of resistor calculator class
    myCal = [[ResistorCalculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//Keyboard disapears opun tap of phone background
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//This method collects values from the textbox and passes them to the series method instance of resistor calculator class
- (IBAction)getSeries:(id)sender {
    float seriesnum = [self.seriesTextField.text floatValue];
    
    [myCal setSeries:seriesnum];
    
    if(myCal.seriesValue >= 1000000){          //To give output in KΩ and MΩ format
        self.seriesTotalLabel.text = [NSString stringWithFormat:@": %.1fMΩ", myCal.seriesValue/1000000];
    }else if(myCal.seriesValue >= 1000){
        self.seriesTotalLabel.text = [NSString stringWithFormat:@": %.1fkΩ", myCal.seriesValue/1000];
    }else {
        self.seriesTotalLabel.text = [NSString stringWithFormat:@": %.1fΩ", myCal.seriesValue];
    }
    
    
    seriesTextField.text = @"";         //clear text field after button press
}

//This method collects values from the textbox and passes them to the parallel mrthod instance of resistor calculator class
- (IBAction)getParallel:(id)sender {
    float parallelsum = [self.parallelTextField.text floatValue];

        [myCal setParallel:parallelsum];

    if(myCal.parallelValue >= 1000000){     //To give output in KΩ and MΩ format
        self.parallelTotalLabel.text = [NSString stringWithFormat:@": %.1fMΩ", myCal.parallelValue/1000000];
    }else if(myCal.parallelValue >= 1000){
        self.parallelTotalLabel.text = [NSString stringWithFormat:@": %.1fkΩ", myCal.parallelValue/1000];
    }else {
        self.parallelTotalLabel.text = [NSString stringWithFormat:@": %.1fΩ", myCal.parallelValue];
    }
    
    parallelTextField.text = @"";       //clear text field after button press

}

//Calculates series combination of previous series ad parallel values
-(IBAction)seriesSuperCalc:(id)sender{
    float totalSeries = myCal.seriesValue + myCal.parallelValue;
    
    if(totalSeries >= 1000000){
        self.seriesSuper.text = [NSString stringWithFormat:@": %.1fMΩ", totalSeries/1000000];
    }else if(totalSeries >= 1000){
        self.seriesSuper.text = [NSString stringWithFormat:@": %.1fkΩ", totalSeries/1000];
    }else {
        self.seriesSuper.text = [NSString stringWithFormat:@": %.1fΩ", totalSeries];
    }
}

//Calculates parallel combination of previous series ad parallel values
- (IBAction)parallelSuperCalc:(id)sender {
    float totalSeries = (myCal.seriesValue*myCal.parallelValue)/(myCal.seriesValue+myCal.parallelValue);
    
    if(totalSeries >= 1000000){
        self.parallelSuper.text = [NSString stringWithFormat:@": %.1fMΩ", totalSeries/1000000];
    }else if(totalSeries >= 1000){
        self.parallelSuper.text = [NSString stringWithFormat:@": %.1fkΩ", totalSeries/1000];
    }else {
        self.parallelSuper.text = [NSString stringWithFormat:@": %.1fΩ", totalSeries];
    }
}


//Clear text fiels and reinitialize method instance variables to zero (restart)
- (IBAction)clearField:(id)sender {
    myCal.parallelValue = 0;
    myCal.seriesValue = 0;
    _seriesTotalLabel.text = @"";
    _parallelTotalLabel.text = @"";
    _seriesSuper.text = @"";
    _parallelSuper.text = @"";
    parallelTextField.text = @"";
    seriesTextField.text = @"";
    
}


@end
