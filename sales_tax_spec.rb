require "sales_tax"

describe "Reciept" do
  before :each do 
    @p1 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
    @p2 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
    @p3 = [ "1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
    @st = Receipt.new
    @product = "1 imported bottle of perfume at 27.99"
  end
  
  it "Total amount and total Sales Tax amount" do
    a, b = @st.print_receipt(@p1)
    a.should == "7.65"
    b.should == "65.15"
    
    a, b = @st.print_receipt(@p2)
    a.should == "1.50"
    b.should == "29.83"

    a, b = @st.print_receipt(@p3)
    a.should == "6.65"
    b.should == "74.63"
  end
  
  it "evaluating qty, rate  and product" do
    qty, rate, product = @st.parse_input(@product)
    qty.should == 1
    product.should == "imported bottle of perfume"
    rate.should == 27.99
  end
  
  it "individual amount and tax amount" do
    amount, tax_amount = @st.tax_calculations("imported bottle of perfume", 1, 27.99)
    amount.should == 27.99
    tax_amount.should == 4.2
  end
  
  it "round_amount" do
    @st.round_amount(6.6444).should == 6.65 
  end
  
end