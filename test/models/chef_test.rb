require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: 'oloo', email: 'oloo@example.com')
  end

  test 'chef should be valid' do
    assert @chef.valid?
  end

  test 'Chef name must be present' do
    @chef.chefname = ''
    assert_not @chef.valid?
  end

  test 'email should be present' do
    @chef.email = ''
    assert_not @chef.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |val|
      @chef.email = val
      assert @chef.valid?, "#{val.inspect} should be valid"
    end
    
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user @example.com @first@first.com user@example,com]
    invalid_addresses.each do |val|
      @chef.email = val
      assert_not @chef.valid?
    end
  end

  test 'email should be unique' do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test 'name must not be too long' do
    @chef.chefname = 'a' * 21
    assert_not @chef.valid?
  end

  test 'name must not be too short' do
    @chef.chefname = 'aaa'
    assert_not @chef.valid?
  end
end