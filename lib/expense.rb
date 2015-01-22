class Expense

  attr_reader(:id, :description, :amount, :date)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @description = attributes.fetch(:description)
    @amount = attributes.fetch(:amount)
    @date = attributes.fetch(:date)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      description = expense.fetch("description")
      amount = expense.fetch("amount").to_f()
      date = expense.fetch("date")
      expenses.push(Expense.new({ :id => id, :description => description, :amount => amount, :date => date }))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (description, amount, date) " \
      "VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_expense|
    (id() == another_expense.id()) &&
      (description() == another_expense.description()) &&
        (amount() == another_expense.amount()) &&
          (date() == another_expense.date())
  end

end
