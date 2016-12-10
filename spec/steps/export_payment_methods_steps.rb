module ExportPaymentMethodsStep
  step 'I click on next button in the footer' do
    find(:xpath, '//div[@class="modal-footer"]/*[contains(text(), "Next")]').trigger('click')
  end

  step 'I submit export payment methods form' do
    find(:xpath, '//input[@type="submit"]').click
  end
end

RSpec.configure { |c| c.include ExportPaymentMethodsStep }
