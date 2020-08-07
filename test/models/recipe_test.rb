require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    chef = Chef.new(chefname: 'oloo', email: 'oloo@example.com')
    @recipe = chef.recipes.new(name: 'Chapati', summary: 'soft home made chapatis', description: 'add water, mix with flour, add salt and suggar, bake')
  end

  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name must be present' do
    @recipe.name = ''
    assert_not @recipe.valid?
  end

  test 'summary must be present' do
    @recipe.summary = ''
    assert_not @recipe.valid?
  end

  test 'description must be present' do
    @recipe.description = ''
    assert_not @recipe.valid?
  end

  test 'name must not be too long' do
    @recipe.name = 'a' * 31
    assert_not @recipe.valid?
  end

  test 'name must not be too short' do
    @recipe.name = 'aaa'
    assert_not @recipe.valid?
  end

  test 'summary must not be too long' do
    @recipe.summary = 'a' * 101
    assert_not @recipe.valid?
  end

  test 'summary must not be too short' do
    @recipe.summary = 'aaa'
    assert_not @recipe.valid?
  end

  test 'description must not be too short' do
    @recipe.description = 'aaaa'
    assert_not @recipe.valid?
  end

  test 'description must not be too long' do
    @recipe.description = 'a' * 201
    assert_not @recipe.valid?
  end

end