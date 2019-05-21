//
//  TableViewController.h
//  ComponentToolbox
//
//  Created by Chima Nnadika [el17cdn] on 17/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//


//The Table View Controller class populates a table with the resistor values
//it segments via the series type 
#import <UIKit/UIKit.h>
#import "ResistorDataModel.h"
#import "FourthViewController.h"

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) ResistorDataModel *model; //set dat amodel method


@end
