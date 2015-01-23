class Category

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      id = category.fetch("id").to_i()
      name = category.fetch("name")
      categories.push(Category.new({ :id => id, :name => name }))
    end
    categories
  end

  define_method(:==) do |another_category|
    (id() == another_category.id()) &&
      (name() == another_category.name())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name) " \
      "VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
