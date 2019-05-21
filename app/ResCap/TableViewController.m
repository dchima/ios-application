//
//  TableViewController.m
//  ComponentToolbox
//
//  Created by Chima Nnadika [el17cdn] on 17/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
        self.model = [[ResistorDataModel alloc] init]; //initialize resistor data model method
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





//Returns number of sections needed in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

//This method returns the number of rows in each section (depending on the number of objects in series array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0){
        return [self.model.e12resistorsArray count];
    }
    if (section == 1){
        return [self.model.e24resistorsArray count];
    }
    if (section == 2){
        return [self.model.e48resistorsArray count];
    }
    if (section == 3){
        return [self.model.e96resistorsArray count];
    }
    else{
        return 0;
    }
}

//This method writes the values of the resistor (in data model)into the table cells. it uses the
//index of the array to locake the object and its parts (numericalvalue and ordercode)
//it populates per section (series)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0){
        Resistor *temporaryResistor = [self.model.e12resistorsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%.1f", temporaryResistor.numericValue];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",temporaryResistor.ordercode];
    }
    
    if (indexPath.section == 1){
        Resistor *temporaryResistor = [self.model.e24resistorsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%.1f", temporaryResistor.numericValue];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",temporaryResistor.ordercode];
    }
    
    if (indexPath.section == 2){
        Resistor *temporaryResistor = [self.model.e48resistorsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%.2f", temporaryResistor.numericValue];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",temporaryResistor.ordercode];
    }
    
    if (indexPath.section == 3){
        Resistor *temporaryResistor = [self.model.e96resistorsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%.2f", temporaryResistor.numericValue];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",temporaryResistor.ordercode];
    }
    
    return cell;
}


//This method writes to and returns the table section headers
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionHeader;
    
    if (section == 0) {
        sectionHeader = @"E12 Series";
    }
    
    if(section == 1){
        sectionHeader = @"E24 Series";
    }
    
    if(section == 2){
        sectionHeader = @"E48 Series";
    }
    
    if(section == 3){
        sectionHeader = @"E96 Series";
    }
    return sectionHeader;
    
    
}






//This method returns and sends the resistor object from its array to the details view controller (fourth view controller)
//the object is then used to programmatically populate the detail view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowComponentDetails"]){
        FourthViewController *dvc = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if (indexPath.section == 0) {
            Resistor *resistor = [self.model.e12resistorsArray objectAtIndex:indexPath.row];
            dvc.resistor = resistor;
        }
        
        if (indexPath.section == 1) {
            Resistor *resistor = [self.model.e24resistorsArray objectAtIndex:indexPath.row];
            dvc.resistor = resistor;
        }
        
        if (indexPath.section == 2) {
            Resistor *resistor = [self.model.e48resistorsArray objectAtIndex:indexPath.row];
            dvc.resistor = resistor;
        }
        
        if (indexPath.section == 3) {
            Resistor *resistor = [self.model.e96resistorsArray objectAtIndex:indexPath.row];
            dvc.resistor = resistor;
        }
        
    }

    
}

@end
