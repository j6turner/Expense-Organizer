require("spec_helper")

describe(Expense) do

  describe(".all") do
    it("is initially empty") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an expense to the table of expenses") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22" })
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe("#==") do
    it("ensures two expenses with equal descriptions, amounts, " \
      "and dates are treated as equal") do
    expense1 = Expense.new({ :id => nil, :description => "groceries",
      :amount => 52.50, :date => "2015-01-22" })
    expense2 = Expense.new({ :id => nil, :description => "groceries",
      :amount => 52.50, :date => "2015-01-22"})
    expect(expense1).to(eq(expense2))
    end
  end

end
