require("spec_helper")

describe(Category) do

  describe(".all") do
    it("is initially empty") do
      expect(Category.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("ensures two categories with equal IDs and names are treated as equal") do
      category1 = Category.new({ :id => nil, :name => "Entertainment" })
      category2 = Category.new({ :id => nil, :name => "Entertainment" })
      expect(category1).to(eq(category2))
    end
  end

  describe("#save") do
    it("adds a category to the table of categories") do
      test_category = Category.new({ :id => nil, :name => "Entertainment" })
      test_category.save()
      expect(Category.all()).to(eq([test_category]))
    end
  end

  describe("#id") do
    it("returns the id for a category") do
      test_category = Category.new({ :id => nil, :name => "Entertainment" })
      test_category.save()
      expect(test_category.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#name") do
    it("returns the name for a category") do
      test_category = Category.new({ :id => nil, :name => "Entertainment" })
      expect(test_category.name()).to(eq("Entertainment"))
    end
  end

end
