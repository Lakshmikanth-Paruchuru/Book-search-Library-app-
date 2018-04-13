//
//  AppDelegate.h
//  Books
//
//  Created by Paruchuru, Lakshmikanth on 11/14/17.
//  Copyright © 2017 Paruchuru, Lakshmikanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

