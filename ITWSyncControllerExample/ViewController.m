//
//  ViewController.m
//  ITWSyncControllerExample
//
//  Created by Bruno Wernimont on 24/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "ITWSyncController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Post a notification with the NSNotificationCenter
    [ITWSyncController setDidStartNotificationName:@"notificationName"];
    [ITWSyncController setDidSuccessNotificationName:@"notificationName"];
    [ITWSyncController setDidFailNotificationName:@"notificationName"];
	
    [ITWSyncController setDidStartSyncBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Did start sync"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        
        // Do your sync stuff
        // Then call [ITWSyncController didSuccessSync];
        // Or [ITWSyncController didFailSync];
    }];
    
    [ITWSyncController setDidSuccessSyncBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Did success sync"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }];
    
    [ITWSyncController setDidFailSyncBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Did fail sync"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];

    }];
    
    [ITWSyncController startSyncing];
    [ITWSyncController didFailSync];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
