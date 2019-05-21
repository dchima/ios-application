//
//  ResistorDataModel.m
//  ComponentToolbox
//
//  Created by Chima Nnadika [el17cdn] on 22/11/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//


//The Data Model implements the Eseries function "pow(10,1/n)" where n is the series
//The resuslting value gives the decade step size of the particular series
//The methods are created within the loop to populate the respective arrays
//Mind you, the factory default values of the E series don't seem to follow the
//mathematical model by default (some values are rounded up instead of down and vice versa.
//So some values had to be hard coded into the array. This method is still more convenient
//Than typing all step values of the series.
#import "ResistorDataModel.h"

@implementation ResistorDataModel

-(instancetype) init {
    self = [super init];
    if (self) {
        
        //Declaration of arrays;
        self.e12resistorsArray = [NSMutableArray array];
        self.e24resistorsArray = [NSMutableArray array];
        self.e48resistorsArray = [NSMutableArray array];
        self.e96resistorsArray = [NSMutableArray array];
        
        //count values for populating arrays
        float count12 = 1;
        float count24 = 1;
        float count48 = 1;
        float count96 = 1;
        
        
        int codeCount = 1565100; //random ordercode value
        
        //The objects are put in a loop to populate the series
        //The instance of the object (i.e. Resistor *e12ser) grabs the object declared
        //and appends intself to the array then starts again till it's finished
        //values are placed in array
        
        //E12 populator
        for(int i = 0; i < 12; i++){
            Resistor *e12ser = [[Resistor alloc] init];
            e12ser.series = @"E12";
            e12ser.numericValue = count12;
            e12ser.unit = @"Ω";     // Ω, kΩ or MΩ
            e12ser.ordercode = codeCount;
            e12ser.price = 0.13;
            [self.e12resistorsArray addObject:e12ser];
            count12 = lroundf((count12*1.21)*10.0)/10.0; //round up or down
            codeCount = codeCount + 9;
            
            //Hard coded values
            if (count12 == 4){count12 = 3.9;}
            if ((count12*10) == 57){count12 = 5.6;}
        }
      
        //E24 populator
        for(int i = 0; i < 24; i++){
            Resistor *e24ser = [[Resistor alloc] init];
            e24ser.series = @"E24";
            e24ser.numericValue = count24;
            e24ser.unit = @"Ω";     // Ω, kΩ or MΩ
            e24ser.ordercode = codeCount;
            e24ser.price = 0.18;
            [self.e24resistorsArray addObject:e24ser];
            count24 = lroundf((count24*1.1)*10.0)/10.0;
            codeCount = codeCount + 17; //randomise for ordercode
            
            //Hard coded values
            if ((count24*10) == 14){count24 = 1.5;}
            if ((count24*10) == 17){count24 = 1.6;}
            if ((count24*10) == 26){count24 = 2.7;}
            if ((count24*10) == 40){count24 = 3.9;}
            if ((count24*10) == 52){count24 = 5.1;}
            if ((count24*10) == 83){count24 = 8.2;}
            if ((count24*10) == 90){count24 = 9.1;}
        }
        
        //E48 populator
        for(int i = 0; i < 48; i++){
            Resistor *e48ser = [[Resistor alloc] init];
            e48ser.series = @"E48";
            e48ser.numericValue = count48;
            e48ser.unit = @"Ω";     // Ω, kΩ or MΩ
            e48ser.ordercode = codeCount;
            e48ser.price = 0.20;
            [self.e48resistorsArray addObject:e48ser];
            count48 = lroundf((count48*1.05)*100.0)/100.00;
            codeCount = codeCount +27;
            
            //Hard Coded Values
            if ((count48*100) == 116){count48 = 1.15;}
            if ((count48*100) == 170){count48 = 1.69;}
            if ((count48*100) == 177){count48 = 1.78;}
            if ((count48*100) == 206){count48 = 2.05;}
            if ((count48*100) == 288){count48 = 2.87;}
            if ((count48*100) == 349){count48 = 3.48;}
            if ((count48*1000) == 4430){count48 = 4.42;}
            if ((count48*1000) == 5370){count48 = 5.36;}
            if ((count48*1000) == 5630){count48 = 5.62;}
            if ((count48*1000) == 6200){count48 = 6.19;}
            if ((count48*1000) == 6500){count48 = 6.49;}
            if ((count48*1000) == 7510){count48 = 7.50;}
            if ((count48*1000) == 7880){count48 = 7.87;}
            if ((count48*1000) == 8260){count48 = 8.25;}
            if ((count48*1000) == 9540){count48 = 9.53;}
   
        }
        
        //E96 populator
        for(int i = 0; i < 96; i++){
            Resistor *e96ser = [[Resistor alloc] init];
            e96ser.series = @"E96";
            e96ser.numericValue = count96;
            e96ser.unit = @"Ω";     // Ω, kΩ or MΩ
            e96ser.ordercode = codeCount;
            e96ser.price = 0.22;
            [self.e96resistorsArray addObject:e96ser];
            count96 = lroundf((count96*1.02)*100.0)/100.00;
            codeCount = codeCount +43;
            
            //Hard coded Values
            if((count96*1000) == 1040){count96 = 1.05;}
            if((count96*1000) == 1090){count96 = 1.10;}
            if((count96*1000) == 1120){count96 = 1.13;}
            if((count96*1000) == 1170){count96 = 1.18;}
            if((count96*1000) == 1200){count96 = 1.21;}
            //Gap of Values too small to correct manufacturer error
            //Hard coding values abandoned to focus on other functionalities
        }
        
    }
    return self;
}

@end
