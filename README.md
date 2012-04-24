## ITWSyncController
ITWSyncController is a class that help you to manage app synchronization, made at [Intotheweb](http://intotheweb.be/)

## How to use it

### Configuration

    [ITWSyncController setDidStartSyncBlock:^{        
		// Do your sync stuff for example JSON loading
    }];
    
    [ITWSyncController setDidSuccessSyncBlock:^{
		// Hide loading view for example 
    }];
    
    [ITWSyncController setDidFailSyncBlock:^{
		// Show error message
    }];

### Use it

Each time you want to sync your app call:
	[ITWSyncController startSyncing];

If success:
	[ITWSyncController didSuccessSync];

Otherwise
	[ITWSyncController didFailSync];

StartSyncing will call didSuccessSyncBlock(), didSuccessSync call didSuccessSyncBlock() same for fail action.

### Notification center

Sometime you want to send a notification that inform any controller that some data has been loaded.

	[ITWSyncController setDidStartNotificationName:@"notificationName"];
	[ITWSyncController setDidSuccessNotificationName:@"notificationName"];
	[ITWSyncController setDidFailNotificationName:@"notificationName"];


## ARC
ITWSyncController is fully compatible out of box with both ARC and non-ARC project.