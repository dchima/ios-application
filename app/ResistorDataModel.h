//
//  ResistorDataModel.h
//  ComponentToolbox
//
//  Created by Chima Nnadika [el17cdn] on 22/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resistor.h"

//The Resistor Data Model Class takes in the characterisitcs of the resistor and populates them
//into arrays of objects holding these characteristics. the arrays are grouped in terms of resistor series
//(E12, E24, E48, E96)
@interface ResistorDataModel : NSObject

@property NSMutableArray *e12resistorsArray; //E12 Resistor Array
@property NSMutableArray *e24resistorsArray; //E24 Resistor Array
@property NSMutableArray *e48resistorsArray; //E48 Resistor Array
@property NSMutableArray *e96resistorsArray; //E96 Resistor Array

@end
