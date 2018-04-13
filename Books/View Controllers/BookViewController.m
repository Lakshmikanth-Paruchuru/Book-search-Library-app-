//
//  ViewController.m
//  Books
//
//  Created by Paruchuru, Lakshmikanth on 11/14/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import "BookViewController.h"
#import "AppDelegate.h"

@interface BookViewController ()
{
    NSDate *fixDate;
}
@end

@implementation BookViewController

@synthesize titleTextField, authorTextField, subjectnameTextField, datePickerControl, lblSelectedDate, book;

-(NSManagedObjectContext *) managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(persistentContainer)]) {
        context = [[delegate persistentContainer] viewContext];
    }
    return context;
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        //Custom init
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if(self.book){
        [titleTextField setText:[self.book valueForKey:@"title"]];
        [authorTextField setText:[self.book valueForKey:@"author"]];
        [subjectnameTextField setText:[self.book valueForKey:@"subjectname"]];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd MMMM yyyy"];
        NSDate *dater;
        dater = [self.book valueForKey:@"duedate"];
        NSString *getDater = [dateFormat stringFromDate:dater];
        [lblSelectedDate setText:[NSString stringWithFormat:@"%@", getDater]];
        NSLog(@"Title %@", titleTextField);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)save:(id)sender {
   
    NSManagedObjectContext *context = [self managedObjectContext];
    if(self.book){
        //Update Existing Book
        [self.book setValue:self.titleTextField.text forKey:@"title"];
        [self.book setValue:self.authorTextField.text forKey:@"author"];
        [self.book setValue:self.subjectnameTextField.text forKey:@"subjectname"];
        [self.book setValue:fixDate forKey:@"duedate"];
    }
    else{
        //Create a new Book
        NSManagedObject *newBook = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
        [newBook setValue:self.titleTextField.text forKey:@"title"];
        [newBook setValue:self.authorTextField.text forKey:@"author"];
        [newBook setValue:self.subjectnameTextField.text forKey:@"subjectname"];
        [newBook setValue:fixDate forKey:@"duedate"];
    }
    NSError *error = nil;
    //Save the object to persistent store
    if(![context save:&error]){
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)datePicker:(id)sender {
    NSDate *myDate = [datePickerControl date];
    fixDate = myDate;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMMM yyyy"];
    NSString *getDate = [dateFormat stringFromDate:myDate];
    [lblSelectedDate setText:[NSString stringWithFormat:@"%@", getDate]];
}
@end
