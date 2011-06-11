//
// Copyright 2011 Jeff Verkoeyen
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AppDelegate.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AppDelegate

@synthesize window = _window;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  NI_RELEASE_SAFELY(_window);
  NI_RELEASE_SAFELY(_rootController);

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Application lifecycle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];

  NILauncherViewController* launcherController =
  [[[NILauncherViewController alloc] initWithNibName:nil bundle:nil] autorelease];
  launcherController.title = @"Basic Launcher Demo";

  NSArray* pages = [NSArray arrayWithObjects:
                    [NSArray arrayWithObjects:
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 1"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 2"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 3"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 4"
                                                       imagePath: nil],
                     nil],
                    [NSArray arrayWithObjects:
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 5"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 6"
                                                       imagePath: nil],
                     nil],
                    [NSArray arrayWithObjects:
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 5"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 6"
                                                       imagePath: nil],
                     nil],
                    [NSArray arrayWithObjects:
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 5"
                                                       imagePath: nil],
                     [NILauncherItemDetails itemDetailsWithTitle: @"Item 6"
                                                       imagePath: nil],
                     nil],
                    nil];
  [launcherController setPages:pages];

  _rootController = [[UINavigationController alloc] initWithRootViewController:launcherController];
  _rootController.view.frame = self.window.bounds;

  [self.window addSubview:_rootController.view];

  [self.window makeKeyAndVisible];

  return YES;
}


@end
