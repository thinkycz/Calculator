//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Thinky on 06.09.14.
//  Copyright (c) 2014 Thinky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
    float First;
    float Second;
    NSMutableString *LastOperation;
}

-(instancetype)init;
-(BOOL)performMultiplyBy:(float)number;
-(BOOL)performDivisionBy:(float)number;
-(BOOL)performSubtraction:(float)number;
-(BOOL)performAddition:(float)number;
-(BOOL)performPower:(float)number;
-(BOOL)performSquareRoot:(float)number;
-(BOOL)performEqual:(float)number;
-(BOOL)performLastOperation;
-(float)getCurrentNumber;
-(void)clear;

@end
