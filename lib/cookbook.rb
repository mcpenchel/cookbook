require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(filepath)
    @recipes = []
    @filepath = filepath
    load_data
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_data
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_data
  end

  private
  def save_data
    CSV.open(@filepath, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_data
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

end
