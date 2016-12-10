require 'rails_helper'

RSpec.describe ApplicationHelper do
  it 'should return <td>$10,000</td>' do
    result = helper.public_number_decorator(10000, tag: 'td', signature: :dollar)
    expect(result).to eql('<td>$10,000</td>')
  end

  it 'should return $10,000' do
    result = helper.public_number_decorator(10000)
    expect(result).to eql('$10,000')
  end

  it 'should return <td>$10,000</td>' do
    result = helper.public_number_decorator(10000, tag: 'td')
    expect(result).to eql('<td>$10,000</td>')
  end

  it 'should return <td>10,000%</td>' do
    result = helper.public_number_decorator(10000, tag: 'td', signature: :percent)
    expect(result).to eql('<td>10,000%</td>')
  end

  it 'should return <td class="red">(10,000)%</td>' do
    result = helper.public_number_decorator(-10000, tag: 'td', signature: :percent)
    expect(result).to eql('<td class="red">(10,000)%</td>')
  end

  it 'should return <td class="red">$(10,000)</td>' do
    result = helper.public_number_decorator(-10000, tag: 'td', signature: :dollar)
    expect(result).to eql('<td class="red">$(10,000)</td>')
  end

  it 'should return <a href="#">$10,000</a>' do
    result = helper.public_number_decorator(10000, tag: 'a', signature: :dollar, attributes: {href: '#'})
    expect(result).to eql('<a href="#">$10,000</a>')
  end

  it 'should return <a href="#" class="blue">$10,000</a>' do
    result = helper.public_number_decorator(10000, tag: 'a', signature: :dollar, attributes: {href: '#', class: 'blue'})
    expect(result).to eql('<a href="#" class="blue">$10,000</a>')
  end

  it 'should return <a href="#" class="blue red">(10,000)%</a>' do
    result = helper.public_number_decorator(-10000, tag: 'a', signature: :percent, attributes: {href: '#', class: 'blue'})
    expect(result).to eql('<a href="#" class="blue red">(10,000)%</a>')
  end

  it 'should return <td class="green">$10,000</td>' do
    result = helper.public_number_decorator(10000, tag: 'td', signature: :dollar, positive_color: 'green')
    expect(result).to eql('<td class="green">$10,000</td>')
  end

  it 'should return <td class="red">$(10,000)</td>' do
    result = helper.public_number_decorator(-10000, tag: 'td', signature: :dollar, positive_color: 'green')
    expect(result).to eql('<td class="red">$(10,000)</td>')
  end
end