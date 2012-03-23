require "sales_tax"

describe "SalesTax" do
  before :each do 
    @p1 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
    @p2 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
    @st = SalesTax.new
  end
  it "Total Amount" do
    @st.receipt(@p1).should == "Total: 65.36"
    @st.receipt(@p2).should == "Total: 29.83"
  end
end