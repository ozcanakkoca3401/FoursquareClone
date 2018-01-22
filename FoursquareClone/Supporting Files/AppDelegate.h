//
//  AppDelegate.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

