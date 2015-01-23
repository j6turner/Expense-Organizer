require("rspec")
require("pg")
require("expense")
require("category")

DB = PG.connect({ :dbname => "expense_organizer_test" })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
  end
end
