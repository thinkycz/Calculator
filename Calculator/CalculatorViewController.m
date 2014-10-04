//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Thinky on 06.09.14.
//  Copyright (c) 2014 Thinky. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mainDisplay;
@property (nonatomic) float currentNumber;
@property (strong, nonatomic) CalculatorBrain *mainBrain;
@end

@implementation CalculatorViewController

//Lazy instantiation
-(CalculatorBrain*) mainBrain
{
    if (!_mainBrain)
    {
        _mainBrain = [[CalculatorBrain alloc] init];
    }
    return _mainBrain;
}

- (IBAction)btnAction:(UIButton *)sender
{
    if ([[[sender titleLabel] text] isEqualToString:@"^2"])
    {
        [self.mainBrain performPower:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"2√"])
    {
        [self.mainBrain performSquareRoot:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"+"])
    {
        [self.mainBrain performAddition:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
        self.currentNumber = 0.f;
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"-"])
    {
        [self.mainBrain performSubtraction:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
        self.currentNumber = 0.f;
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"*"])
    {
        [self.mainBrain performMultiplyBy:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
        self.currentNumber = 0.f;
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"/"])
    {
        [self.mainBrain performDivisionBy:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
        self.currentNumber = 0.f;
    }
    else if ([[[sender titleLabel] text] isEqualToString:@"="])
    {
        [self.mainBrain performEqual:self.currentNumber];
        self.currentNumber = [self.mainBrain getCurrentNumber];
        [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
    }
    else
    {
        [NSException raise:@"Bad command:" format:@" code %@ is not accepted.",[[sender titleLabel] text]];
    }

}

- (IBAction)btnNumber:(UIButton *)sender
{
    self.currentNumber = self.currentNumber * 10 + [[sender.titleLabel text] intValue];
    [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
}

- (IBAction)btnClear:(UIButton *)sender
{
    [self.mainBrain clear];
    self.currentNumber = 0.f;
    [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
}

- (IBAction)btnDot:(UIButton *)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.currentNumber = 0.f;
    [self.mainDisplay setText: [NSString stringWithFormat:@"%f", self.currentNumber]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
