//
//  Resistor.h
//  ComponentToolbox
//
//  Created by Chima Nnadika [el17cdn] on 22/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//


//The Resistor Class stores the characterstics of a resistor (unit, value, price, series and ordercode)
//to be used in the data model. of the app.
#import <Foundation/Foundation.h>

@interface Resistor : NSObject

@property NSString *series;
@property float numericValue;
@property NSString *unit;
@property NSInteger ordercode;
@property float price;

@end
