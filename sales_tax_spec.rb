require "sales_tax"

describe "SalesTax" do
  before :each do 
    @p1 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
    @p2 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
    @p3 = [ "1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
    @st = SalesTax.new
  end
  
  it "Sales tax amount" do
    a, b = @st.receipt(@p1)
    a.should == "7.65"
    b.should == "65.15"
    
    a, b = @st.receipt(@p2)
    a.should == "1.50"
    b.should == "29.83"

    a, b = @st.receipt(@p3)
    a.should == "6.65"
    b.should == "74.63"
  end
  
  it "Amount" do

  end
  
end