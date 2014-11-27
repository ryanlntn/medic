class BaseController < UIViewController

  def medic
    UIApplication.sharedApplication.delegate.health_store
  end

end
