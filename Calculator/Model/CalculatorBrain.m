//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Thinky on 06.09.14.
//  Copyright (c) 2014 Thinky. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        First = 0.f;
        Second = 0.f;
        LastOperation = [[NSMutableString alloc] initWithString:@""];
    }
    return self;
}

-(BOOL)performMultiplyBy:(float)number
{
    Second = number;
    [self performLastOperation];
    LastOperation = (NSMutableString*)@"*";
    return YES;
}

-(BOOL)performDivisionBy:(float)number
{
    Second = number;
    [self performLastOperation];
    LastOperation = (NSMutableString*)@"/";
    return YES;
}

-(BOOL)performSubtraction:(float)number
{
    Second = number;
    [self performLastOperation];
    LastOperation = (NSMutableString*)@"-";
    return YES;
}

-(BOOL)performAddition:(float)number
{
    Second = number;
    [self performLastOperation];
    LastOperation = (NSMutableString*)@"+";
    return YES;
}

-(BOOL)performPower:(float)number
{
    First = number;
    First *= First;
    return YES;
}

-(BOOL)performSquareRoot:(float)number
{
    First = number;
    First = sqrtf(First);
    return YES;
}

-(BOOL)performEqual:(float)number
{
    Second = number;
    [self performLastOperation];
    LastOperation = (NSMutableString*)@"=";
    return YES;
}

-(BOOL)performLastOperation
{
    if ([LastOperation isEqualToString:@"*"])
    {
        First *= Second;
    }
    else if ([LastOperation isEqualToString:@"/"])
    {
        First /= Second;
    }
    else if ([LastOperation isEqualToString:@"+"])
    {
        First += Second;
    }
    else if ([LastOperation isEqualToString:@"-"])
    {
        First -= Second;
    }
    else
    {
        First = Second;
    }
    return YES;
}

-(float)getCurrentNumber
{
    return First;
}

-(void)clear
{
    First = 0.f;
    Second = 0.f;
    LastOperation = (NSMutableString*)@"";
}

@end
