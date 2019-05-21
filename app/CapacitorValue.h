//
//  CapacitorValue.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 27/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//This Class defines the characteristics of the capacitor
//To be used for display in the application.
//These characteriscics include its value, band color, tolerance and multiplier.
@interface CapacitorValue : NSObject


@property (nonatomic) double value;             //capacitor value
@property (nonatomic) double tolerance;         //tolerance value
@property (nonatomic) double multiplier;        //miltiplier value

@property NSInteger numberOfBands;

//for numerical calculation
@property NSInteger firstSignificantFigure;         //first  digit value of picker
@property NSInteger secondSignificantFigure;        //second digit value of picker


@property NSInteger multiplierIndex;                //value of multiplier of picker
@property NSInteger toleranceIndex;                 //value of tolerance of picker


@property (nonatomic,strong) NSArray *bandColorArray;       //array of band color
@property (nonatomic,strong) NSArray *toleranceColorArray;  //array of tolerance colour


-(double) value;            //function to get capacitor value
-(double) tolerance;        //function to get capacitor tolerance

@end
