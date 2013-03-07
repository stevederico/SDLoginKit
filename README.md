SDLoginKit
=======
**Login/Sign-Up ViewControllers Ready-To-Use with your Custom Backend**

Building a authentication system can be tedious and repeative. Why write the same code over and over when you could be spending time working on real application logic? SDLoginKit is a simple library that provides Login and Sign-Up viewcontrollers out-of-the-box. Just subscribe to a delegate callback, respond with the built-in success/failure methods (or roll your own) then BAM! You are ready to start managing and creating users. Want to customize the entire experience? No problem just override `authenticateWithCredential` and all the codez belong to you! You can even add your own logo to the login screen. Just set `logoImage` to the `UIImage` of your choice.

> SDLoginKit is named LoginKit, because it has everything you need add a fully-customizable authentication system to your iOS Application.

SDLoginKit is meant to save you time so you can focus on what matters, application logic. The library is still a little green behind the ears and I would love to see any issues or pull request you may have. There is a sample project if you have any question on how it all works.

Submit an Pull Request/Issue/Enhancement and keep up with my progress in the [worklog](https://github.com/stevederico/SDLoginKit/blob/master/_worklog).

I am working to create pre-defined implementations for different authentication systems like the following:
* Devise
* OmniAuth
* Your-favorite-authenication

Please help me by submitting a generic implementation with your back-end of choice.

Overall, this is a great way to get your authentication up and running then you can go from there.

> If you enjoy this project, I would encourage you to check out [SDScaffoldKit](http://www.github.com/stevederico/SDScaffoldKit) the easiest way to create views for your Core Data models. I also highly recommend you follow [Mattt Thompson](http://www.github.com/mattt) and his series of open source libraries covering the mission-critical aspects of an iOS app's infrastructure. Be sure to check out its sister projects: [GroundControl](https://github.com/mattt/GroundControl), [SkyLab](https://github.com/mattt/SkyLab), [CargoBay](https://github.com/mattt/CargoBay), and [houston](https://github.com/mattt/houston).

Follow [@stevederico](http://www.twitter.com/stevederico) on twitter, tell me what you think.  [![Twitter image](http://f.cl.ly/items/1X0V1N003j2h192x3J0Z/Screen%20Shot%202013-02-11%20at%2012.48.45%20AM.png)](http://www.twitter.com/stevederico)

Watch [refactor.tv](http://www.refactor.tv), a podcast with [Sam Soffes](http://www.twitter.com/soffes) and myself, where we cover iOS and Open-source projects each week.

## Example Usage
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //Add SDLoginKit
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    [loginViewController setDelegate:self];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self.viewController presentViewController:navController animated:YES completion:nil];

    return YES;
}

#pragma mark - SDLoginViewControllerDelegate

- (void)loginViewController:(SDLoginViewController*)loginViewController authenticateWithCredential:(NSURLCredential*)credential{
    [loginViewController loginViewControllerDidAuthenticate];
}

- (void)signUpViewController:(SDSignUpViewController*)signUpViewController signUpWithCredentials:(NSDictionary*)credentials{
    [signUpViewController signUpViewControllerDidSignUp];      
}
```
## Sample Images
![Sign In](http://dl.dropbox.com/u/12035142/Screenshots/3.png)
![Password Reset](http://dl.dropbox.com/u/12035142/Screenshots/4.png)
![Sign Up](http://dl.dropbox.com/u/12035142/Screenshots/5.png)
![Logo](http://f.cl.ly/items/1J0w2Z1I2J0v20011h2c/iOS%20Simulator%20Screen%20shot%20Jan%2027,%202013%202.31.54%20PM.png)
## Contact

Steve Derico

- http://github.com/stevederico
- http://twitter.com/stevederico
- steve@stevederico.com

## License


SDLoginKit is available under the MIT license. 
