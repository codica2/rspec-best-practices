module ExpectationSteps
  step 'I should be on :path' do |path|
    expect(page.current_path).to eql(path)
  end

  step 'I should see :content' do |content|
    expect(page).to have_content(content)
  end

  step 'I should see following content:' do |content|
    content.each { |string| send 'I should see :content', string.first }
  end
end

RSpec.configure { |c| c.include ExpectationSteps }
