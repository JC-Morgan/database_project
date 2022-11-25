require 'recipe_repository'

describe RecipeRepository do

  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end


  it "returns all recipes" do

    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq 3

    expect(recipes.first.name).to eq "Spaghetti Bolognese"
    expect(recipes.first.cooking_time).to eq "110"
    expect(recipes.first.rating).to eq "5"

    expect(recipes[1].name).to eq "Chickpea Curry"
    expect(recipes[1].cooking_time).to eq "50"
    expect(recipes[1].rating).to eq "4"

    expect(recipes.last.name).to eq "Scrambled Tofu"
    expect(recipes.last.cooking_time).to eq "30"
    expect(recipes.last.rating).to eq "2"

  end


  it " Returns a single Recipe object that corresponds with the id requested" do

    repo = RecipeRepository.new
    recipe = repo.find(3)

    expect(recipe.name).to eq "Scrambled Tofu"
    expect(recipe.cooking_time).to eq "30"
    expect(recipe.rating).to eq "2"

  end

end
