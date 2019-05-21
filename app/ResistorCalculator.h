//
//  ResistorCalculator.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 05/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//


//This class is used to calculate Resistor inputs in
//Series and Parallel combinations and returns a total value
#import <Foundation/Foundation.h>

@interface ResistorCalculator : NSObject
@property float seriesValue;
@property float parallelValue;
@property float total;

//Declaration of function sets and inintialisations.
-(void) setSeries:(float) newSeriesValue;
-(void) setParallel:(float) newParallelValue;
-(float) getTotal;
-(id) init;

@end
