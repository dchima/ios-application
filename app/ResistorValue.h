//
//  ResistorValue.h
//  ResistorPicker
//
//  Created by Craig A. Evans on 12/09/2014.
//  Copyright (c) 2014 University of Leeds. All rights reserved.
//


//This Class defines further characteristics of the resistor
//To be used for display in the application.
//These characteriscics include its value, band color, tolerance and multiplier.
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ResistorValue : NSObject

@property (nonatomic) double value;             //resistance value
@property (nonatomic) double tolerance;         //tolerance value
@property (nonatomic) double multiplier;        //miltiplier value

@property NSInteger numberOfBands;

//for numerical calculation
@property NSInteger firstSignificantFigure;         //first  digit value of picker
@property NSInteger secondSignificantFigure;        //second digit value of picker
@property NSInteger thirdSignificantFigure;         //third digit value of picker

@property NSInteger multiplierIndex;                //value of multiplier of picker
@property NSInteger toleranceIndex;                 //value of tolerance of picker


@property (nonatomic,strong) NSArray *bandColorArray;       //array of band color
@property (nonatomic,strong) NSArray *toleranceColorArray;  //array of tolerance colour


-(double) value;            //function to get resistor value
-(double) tolerance;        //function to get resistor tolerance

@end
