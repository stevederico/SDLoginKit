SDLoginKit
=======
**Ready-To-Use Login/Sign-Up Views and Controllers for Your Backend**

Building a authentication system can be tedious and repeative. Why write the same code over and over when you could be spending time working on real application logic? SDLoginKit is a simple library that provides Login and Sign-Up viewcontrollers out-of-the-box. Just subscribe to a few delegate callbacks for success/failure and BAM! You are ready to start managing and creating users. Want to customize the entire experience? No problem just override shouldBeginLogin and all the codez belong to you!

> SDLoginKit is named LoginKit, because it has everything you need add a fully-customizable authentication system to your iOS Application.

SDLoginKit is meant to save you time so you can focus on what matters, application logic. The library is still a little green behind the ears and I would love to see any issues or pull request you may have. There is a sample project if you have any question on how it all works.

We are working to create pre-defined implementations for different authentication systems like the following:
* Devise
* OmniAuth
* Your-favorite-authenication

Please help us by submitting a generic implementation with your back-end of choice.

Overall, this is a great way to get your authentication up and running then you can go from there.

> If you enjoy this project, I would encourage you to check out [SDScaffoldKit](http://www.github.com/stevederico/SDScaffoldKit) the easiest way to create views for your Core Data models. I also highly recommend you follow [Mattt Thompson](http://www.github.com/mattt) and his series of open source libraries covering the mission-critical aspects of an iOS app's infrastructure. Be sure to check out its sister projects: [GroundControl](https://github.com/mattt/GroundControl), [SkyLab](https://github.com/mattt/SkyLab), [CargoBay](https://github.com/mattt/CargoBay), and [houston](https://github.com/mattt/houston).

## Getting Started

### Create Core Data Models

1. Add `CoreData.framework` into your project
2. Create Core Data Model
3. `#import "SDScaffoldKit.h"` and create an instance with desginated initializer `initWithEntityName:soryBy:context:andStyle:`

```objective-c
  SDScaffoldIndexViewController *scaffoldViewController = [[SDScaffoldIndexViewController alloc] 
    initWithEntityName:@"User" sortBy:@"lastname" context:[self managedObjectContext] andStyle:UITableViewStyleGrouped];
```
Then wrap your `SDScaffoldIndexViewController` instance in a `UINavigationController`

```objective-c 
 UINavigationController *navController = [[UINavigationController alloc] 
    initWithRootViewController:scaffoldViewController];
```
Done!


## Example Usage
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    SDScaffoldIndexViewController *scaffoldViewController = [[SDScaffoldIndexViewController alloc] initWithEntityName:@"User" 
     sortBy:@"lastname" context:[self managedObjectContext]];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:scaffoldViewController];
  
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}
```
## Sample Images
![User Index](http://f.cl.ly/items/3K390q3k143G0P1j2O2a/iOS%20Simulator%20Screen%20shot%20Jan%2027,%202013%201.47.16%20PM.png) 
![Add User](http://f.cl.ly/items/3m1d1w0J3C1n2u1Q2t1B/iOS%20Simulator%20Screen%20shot%20Jan%2027,%202013%201.47.22%20PM.png) 

## Contact

Steve Derico

- http://github.com/stevederico
- http://twitter.com/stevederico
- steve@deri.co

## License


SDLoginKit is available under the MIT license. 
