//
//  ViewController.m
//  MultiSelectionRows
//
//  Created by sri Divya on 12/10/16.
//  Copyright © 2016 MyCompanyName. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblOptions;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arOptions = [[NSMutableArray alloc] init];
    for(int i = 1; i <= 20; i++) {
        [arOptions addObject:[NSString stringWithFormat:@"CellData %i", i]];
    }
    arSelectedRows = [[NSMutableArray alloc] init];
    
    UIButton *btnAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnAlert.frame = CGRectMake(20, self.view.frame.size.height - 50 + 5, self.view.frame.size.width - 20 - 20, 50 - 10);
    [btnAlert setTitle:@"Selected Rows" forState:UIControlStateNormal];
    [btnAlert addTarget:self action:@selector(btnAlertTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAlert];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void)btnAlertTapped:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You selected" message:[[self getSelections] componentsJoinedByString:@", "] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(NSArray *)getSelections {
    NSMutableArray *selections = [[NSMutableArray alloc] init];
    
    for(NSIndexPath *indexPath in arSelectedRows) {
        [selections addObject:[arOptions objectAtIndex:indexPath.row]];
    }
    
    return selections;
}

#pragma UITableView delegate functions

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arOptions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    }
    
    cell.textLabel.text = [arOptions objectAtIndex:indexPath.row];
    if([arSelectedRows containsObject:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [arSelectedRows addObject:indexPath];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [arSelectedRows removeObject:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
