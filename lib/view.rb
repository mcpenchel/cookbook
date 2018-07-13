class View
  def ask_for_name
    puts "What's the name of the recipe?"
    gets.chomp
  end

  def ask_for_description
    puts "What's the description of the recipe?"
    gets.chomp
  end

  def ask_for_which_to_remove
    puts "What's the number of the recipe you want to remove?"
    gets.chomp.to_i - 1
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} | #{recipe.description}"
    end
  end
end
