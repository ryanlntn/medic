class AppDelegate
  attr_accessor :window
  attr_reader :health_store

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @health_store = Medic::Store.new
    controller = MenuController.new

    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)
    @window.makeKeyAndVisible

    true
  end
end



