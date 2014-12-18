class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    controller = MenuController.new

    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)
    @window.makeKeyAndVisible

    true
  end
end



