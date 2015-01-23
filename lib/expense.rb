class Expense

  attr_reader(:id, :description, :amount, :date, :category_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @description = attributes.fetch(:description)
    @amount = attributes.fetch(:amount)
    @date = attributes.fetch(:date)
    @category_id = attributes.fetch(:category_id)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      description = expense.fetch("description")
      amount = expense.fetch("amount").to_f()
      date = expense.fetch("date")
      category_id = expense.fetch("category_id").to_i()
      expenses.push(Expense.new({ :id => id, :description => description,
        :amount => amount, :date => date, :category_id => category_id }))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (description, amount, date, category_id) " \
      "VALUES ('#{@description}', #{@amount}, '#{@date}', #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_expense|
    (id() == another_expense.id()) &&
      (description() == another_expense.description()) &&
        (amount() == another_expense.amount()) &&
          (date() == another_expense.date()) &&
            (category_id() == another_expense.category_id())
  end

  define_method(:category) do

    # below SELECT statement assumes one and only one row is returned
    returned_categories = DB.exec(
      "SELECT E.category_id" \
      ", C.name " \
      "FROM expenses E " \
      "JOIN categories C " \
      "ON E.category_id = C.id " \
      "WHERE E.id = #{self.id()};")

    returned_categories.each() do |category|
      category_name = params.fetch("name")
      category_id = params.fetch("category_id").to_i()
      categories.push(Category.new({ :id => category_id, :name => category_name }))
    end

    categories
  end

end
