//
//  HandSetupViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "HandSetupViewController.h"
#import "RoundsTableViewController.h"
#import "Game.h"
#import "Player.h"

@interface HandSetupViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *partnerPicker;

@property (nonatomic, readwrite) Player *selectedPicker;
@property (nonatomic, readwrite) Player *selectedPartner;

@end

@implementation HandSetupViewController

- (IBAction)createHand:(id)sender {
    [self.game createNewHandWithPicker:self.selectedPicker partner:self.selectedPartner];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.roundsTableViewController didCreateNewHand];
}

#pragma mark - Picker Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if (pickerView == self.pickerPicker) {
        return [[self pickerChoices] count];
    }
    if (pickerView == self.partnerPicker) {
        return [[self partnerChoices] count];
    }
    return 0;
}

#pragma mark - Picker Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.pickerPicker) {
        return [[[self pickerChoices] objectAtIndex:row] name];
    }
    if (pickerView == self.partnerPicker) {
        return [[[self partnerChoices] objectAtIndex:row] name];
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == self.pickerPicker) {
        self.selectedPicker = [[self pickerChoices] objectAtIndex:row];
    }
    if (pickerView == self.partnerPicker) {
        self.selectedPartner = [[self partnerChoices] objectAtIndex:row];
    }
}

#pragma mark - Helpers

- (NSArray *)pickerChoices
{
    return self.game.players;
}

- (NSArray *)partnerChoices
{
    return self.game.players;
}

@end
