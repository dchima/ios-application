//
//  ResistorValue.m
//  ResistorPicker
//
//  Created by Craig A. Evans on 12/09/2014.
//  Copyright (c) 2014 University of Leeds. All rights reserved.
//

#import "ResistorValue.h"

//This class sets the band colour array and tolerance array of the resistpr
//Most of the resistor value calculations from the picker views ae done through this method.
@implementation ResistorValue

- (id)init
{
    self = [super init];
    if (self) {
        
        self.numberOfBands = 3;  // 3 band resistor by default;
        
        self.bandColorArray = [NSArray arrayWithObjects:
                           [UIColor blackColor],
                           [UIColor brownColor],
                           [UIColor redColor],
                           [UIColor orangeColor],
                           [UIColor yellowColor],
                           [UIColor greenColor],
                           [UIColor blueColor],
                           [UIColor magentaColor],
                           [UIColor grayColor],
                           [UIColor whiteColor],
                           [UIColor colorWithRed:0.99 green:0.76 blue:0.0 alpha:0.9], // gold
                           [UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9], // silver
                           nil];
        
        self.toleranceColorArray = [NSArray arrayWithObjects:
                                    [UIColor brownColor],
                                    [UIColor redColor],
                                    [UIColor greenColor],
                                    [UIColor blueColor],
                                    [UIColor magentaColor],
                                    [UIColor grayColor],
                                    [UIColor colorWithRed:0.99 green:0.76 blue:0.0 alpha:0.9], // gold
                                    [UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9], // silver
                                    [UIColor clearColor],   // none
                                    nil];

    }
    return self;
}

//The multiplier function returns the value of the resistor
//with a higher or lower order depending on the multipler band ascribed to it
-(double) value {
    if (self.multiplierIndex == 10) {  // gold is 0.1%
        self.multiplier = pow(10.0,-1);
    }
    else if (self.multiplierIndex == 11) {  // silver is 0.01%
        self.multiplier = pow(10.0,-2);
    }
    else {
        self.multiplier = pow(10.0,self.multiplierIndex);
    }
    
    if (self.numberOfBands == 4) {
        self.value = (self.firstSignificantFigure*100 + self.secondSignificantFigure*10 + self.thirdSignificantFigure) * self.multiplier;
    }
    if(self.numberOfBands == 3){
        self.value = (self.firstSignificantFigure*10 + self.secondSignificantFigure) * self.multiplier;
    }
    
    return _value;
    
}

//this function returns the value of tolerance
//for the resistor
-(double) tolerance {
    
    if (self.toleranceIndex == 0) {  // Brown
        self.tolerance = 1.0;
    }
    else if (self.toleranceIndex == 1) {  // Red
        self.tolerance = 2.0;
    }
    else if (self.toleranceIndex == 2) {  // Green
        self.tolerance = 0.5;
    }
    else if (self.toleranceIndex == 3) {  // Blue
        self.tolerance = 0.25;
    }
    else if (self.toleranceIndex == 4) {  // Violet
        self.tolerance = 0.1;
    }
    else if (self.toleranceIndex == 5) {  // Gray
        self.tolerance = 0.05;
    }
    else if (self.toleranceIndex == 6) {  // Gold
        self.tolerance = 5.0;
    }
    else if (self.toleranceIndex == 7) {  // Silver
        self.tolerance = 10.0;
    }
    else {
        self.tolerance = 20.0;
    }

    return _tolerance;
}


@end
