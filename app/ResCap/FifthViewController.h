//
//  FifthViewController.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 05/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResistorCalculator.h"

//This class holds values of the declarations for the series/paralle calculator view
@interface FifthViewController : UIViewController{
    ResistorCalculator *myCal;
}
//input text fields
@property (weak, nonatomic) IBOutlet UITextField *seriesTextField;      //series input text field
@property (weak, nonatomic) IBOutlet UITextField *parallelTextField;    //parallel input text field

//action buttons for the calculator view controller
- (IBAction)getSeries:(id)sender;
- (IBAction)getParallel:(id)sender;
- (IBAction)seriesSuperCalc:(id)sender;
- (IBAction)parallelSuperCalc:(id)sender;
- (IBAction)clearField:(id)sender;


//Output labels to show the series and parallel Outputs
@property (weak, nonatomic) IBOutlet UILabel *seriesSuper;
@property (weak, nonatomic) IBOutlet UILabel *parallelSuper;
@property (weak, nonatomic) IBOutlet UILabel *seriesTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *parallelTotalLabel;


@end
