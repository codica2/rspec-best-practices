module ResponsiveHelper

  def resize_window_to_mobile
    resize_window_by([320, 2560])
  end

  def resize_window_to_tablet
    resize_window_by([960, 640])
  end

  def resize_window_default
    resize_window_by([1600, 1600])
  end

  private

  def resize_window_by(size)
    Capybara.page.driver.browser.manage.window.resize_to(size[0], size[1])
  end

end