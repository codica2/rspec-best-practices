module RequestSpecHelper

  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def drop_in_dropzone(file_path)
    # Generate a fake input selector
    page.execute_script <<-JS
    var fileList = []
    fakeFileInput = window.$('<input/>').attr(
      {id: 'fakeFileInput', type:'file'}
    ).appendTo('body');
    JS
    # Attach the file to the fake input selector with Capybara
    attach_file("fakeFileInput", file_path)
    # Add the file to a fileList array
    page.execute_script("fileList = [fakeFileInput.get(0).files[0]]")
    # Trigger the fake drop event
    page.execute_script <<-JS
    var e = jQuery.Event('drop', { dataTransfer : { files : fileList } });
    $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
    JS
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end

end
