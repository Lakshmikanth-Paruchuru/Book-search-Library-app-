//
//  ViewController.h
//  Books
//
//  Created by Paruchuru, Lakshmikanth on 11/14/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface BookViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerControl;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectedDate;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (weak, nonatomic) IBOutlet UITextField *subjectnameTextField;

@property (strong) NSManagedObject *book;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)datePicker:(id)sender;

@end

