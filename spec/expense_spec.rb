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
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe("#==") do
    it("ensures two expenses with equal IDs, descriptions, amounts, " \
      "and dates are treated as equal") do
    expense1 = Expense.new({ :id => nil, :description => "groceries",
      :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
    expense2 = Expense.new({ :id => nil, :description => "groceries",
      :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
    expect(expense1).to(eq(expense2))
    end
  end

  describe("#id") do
    it("returns the id for an expense") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
      test_expense.save()
      expect(test_expense.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#description") do
    it("returns the description for an expense") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
      expect(test_expense.description()).to(eq("groceries"))
    end
  end

  describe("#amount") do
    it("returns the amount for an expense") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
      expect(test_expense.amount()).to(eq(52.50))
    end
  end

  describe("#date") do
    it("returns the date for an expense") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
      expect(test_expense.date()).to(eq("2015-01-22"))
    end
  end

  describe("#category_id") do
    it("returns the category id for an expense") do
      test_expense =
        Expense.new({ :id => nil, :description => "groceries",
          :amount => 52.50, :date => "2015-01-22", :category_id => 3 })
        expect(test_expense.category_id()).to(eq(3))
    end
  end

end
