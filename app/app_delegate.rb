class AppDelegate
  attr_accessor :window
  attr_reader :health_store

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @health_store = HKHealthStore.new
    $hs = @health_store

    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = AuthController.new
    @window.makeKeyAndVisible

    true
  end
end



