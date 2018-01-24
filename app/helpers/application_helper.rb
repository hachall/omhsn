module ApplicationHelper

  def current_class?(test_path)
    return 'active-nav navbar-wagon-item navbar-wagon-link' if request.path == test_path
      'navbar-wagon-item navbar-wagon-link'
  end

end
