//
//  ViewController.h
//  MultiSelectionRows
//
//  Created by sri Divya on 12/10/16.
//  Copyright © 2016 MyCompanyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *arOptions;
    NSMutableArray *arSelectedRows;
}

@end

