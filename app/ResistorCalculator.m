//
//  ResistorCalculator.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 05/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

//The implemetation file of the class ResistorCalculator
//instances of this class is used to solve series and parallel
//combinations.

#import "ResistorCalculator.h"

@implementation ResistorCalculator

//Initial values of set variables
-(id) init{
    if (self = [super init]) {
        _seriesValue = 0.0;
        _parallelValue = 0.0;
    }
    return self;
}

//Adds series values to previous series value
-(void) setSeries:(float)newSeriesValue{
    _seriesValue = _seriesValue + newSeriesValue;
}

//Adds parallel values to previous parallel values
-(void) setParallel:(float)newParallelValue{
    if (_parallelValue == 0){ //check for, and ignore zero value input
        _parallelValue = newParallelValue;
    }else{
        _parallelValue = 1/(1/_parallelValue + 1/newParallelValue);
    }
}


//Totals current series and parallel values
-(float) getTotal{
    if (_parallelValue == 0){//check for, and ignore zero value input
        _total = _seriesValue;
    }
    else{
    _total = _seriesValue + 1/_parallelValue;
    }
    return _total;
}
@end
