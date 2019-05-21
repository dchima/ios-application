//
//  CapacitorValue.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import "CapacitorValue.h"

//The capacitor values and properties from the picker are calculated via this class implementation
@implementation CapacitorValue

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
                                    [UIColor blackColor],
                                    [UIColor brownColor],
                                    [UIColor redColor],
                                    [UIColor orangeColor],
                                    [UIColor yellowColor],
                                    [UIColor greenColor],
                                    [UIColor grayColor],
                                    [UIColor whiteColor],
                                    [UIColor colorWithRed:0.99 green:0.76 blue:0.0 alpha:0.9], // gold
                                    [UIColor colorWithRed:0.76 green:0.80 blue:0.80 alpha:0.9], // silver,   // none
                                    nil];
        
    }
    return self;
}

-(double) value {
    
    if (self.multiplierIndex == 10 || self.multiplierIndex == 9) {  // White and gold is 0.1%
        self.multiplier = pow(10.0,-1);
    }
    else if (self.multiplierIndex == 11 || self.multiplierIndex == 8) {  // Grey and silver is 0.01%
        self.multiplier = pow(10.0,-2);
    }
    else {
        self.multiplier = pow(10.0,self.multiplierIndex);
    }
    
    if (self.numberOfBands == 3) {
        self.value = (self.firstSignificantFigure*10 + self.secondSignificantFigure) * self.multiplier;
    }
    
    return _value;
    
}

-(double) tolerance {
    
    if (self.toleranceIndex == 0) {  // Black
        self.tolerance = 20.0;
    }
    else if (self.toleranceIndex == 1) {  // Brown
        self.tolerance = 1.0;
    }
    else if (self.toleranceIndex == 2) {  // Red
        self.tolerance = 2.0;
    }
    else if (self.toleranceIndex == 3) {  // Orange
        self.tolerance = 3.0;
    }
    else if (self.toleranceIndex == 4) {  // Yellow
        self.tolerance = 4.0;
    }
    else if (self.toleranceIndex == 5) {  // Green
        self.tolerance = 5.0;
    }
    else if (self.toleranceIndex == 6) {  // Grey
        self.tolerance = 80.0;
    }
    else if (self.toleranceIndex == 7) {  // White
        self.tolerance = 10.0;
    }
    else if (self.toleranceIndex == 8) {  // Gold
        self.tolerance = 5.0;
    }
    else if (self.toleranceIndex == 9) { //Silver
        self.tolerance = 10.0;
    }else {
        self.tolerance = 0;
    }
    
    return _tolerance;
}

@end
