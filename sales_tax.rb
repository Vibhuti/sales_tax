class Receipt
  
  IMPORT_TAX = 5.0
  SALES_TAX = 10.0
  CENTS_ROUNDING_MULTIPLIER = 20.0
  
  def print_receipt(products = input)
    amount_arr = []
    tax_arr = []
    products.each do |i|      
      qty, rate, product = parse_input(i)
      amount, tax_amount = tax_calculations(product, qty, rate)
      amount_with_tax = (amount + tax_amount).round(2)
      amount_arr << amount_with_tax
      tax_arr << tax_amount
      p "#{qty} #{product}: #{amount_with_tax}"
    end
    total_amount =  sprintf( "%0.02f", (amount_arr.reduce{ |sum, x| (sum + x) }))
    total_sales_tax = sprintf( "%0.02f", (tax_arr.reduce{ |sum, x| (sum + x) }))
    p "Sales Tax: " +  total_sales_tax
    p "Total: " + total_amount
    return total_sales_tax, total_amount
  end
  
  def parse_input(i)
    s = i.split
    qty = s[0].to_i
    rate = s[-1].to_f
    product = i.split(" at ")[0].delete("/0-9/").strip
    return qty, rate, product
  end
  
  def tax_calculations(product, qty, rate)
    sales_tax_percentage, import_duty_percentage = get_taxation_rates(product)   
    amount = qty * rate
    tax_amount = amount * (sales_tax_percentage + import_duty_percentage)
    return amount, round_amount(tax_amount)
  end
  
  def get_taxation_rates(product)
    zero_tax_items = ["book", "chocolate bar", "packet of headache pills", "box of imported chocolates", "imported box of chocolates"]
    sales_tax_percentage = zero_tax_items.include?(product) ? 0.0 : (SALES_TAX/100)
    import_duty_percentage = product.include?("imported") ? (IMPORT_TAX/100) : 0.0
    return sales_tax_percentage, import_duty_percentage
  end
  
  def round_amount(amount)
    ((amount * 20).round.to_f / CENTS_ROUNDING_MULTIPLIER).round(3)
  end
  
  def input
    return a = File.open("./input.txt").readlines
  end
  
end
@p1 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
@p2 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
@p3 = [ "1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]

st = Receipt.new
p "-----------------------------------Receipt from input.txt file----------------------"
st.print_receipt()
p "---------------------------------------Receipt from input 1-------------------------"
st.print_receipt(@p1)
p "---------------------------------------Receipt from input 2-------------------------"
st.print_receipt(@p2)
p "---------------------------------------Receipt from input 3-------------------------"
st.print_receipt(@p3)


# PROBLEM TWO: SALES TAXES
#     
#   Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. 
#   Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.
#     
#   When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), 
#   finishing with the total cost of the items, and the total amounts of sales taxes paid.  
#   
#   The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the 
#   nearest 0.05) amount of sales tax.
#     
#   Write an application that prints out the receipt details for these shopping baskets...
#   
#   INPUT:
#     
#   Input 1:
#   1 book at 12.49
#   1 music CD at 14.99
#   1 chocolate bar at 0.85
#     
#   Input 2:
#   1 imported box of chocolates at 10.00
#   1 imported bottle of perfume at 47.50
#     
#   Input 3:
#   1 imported bottle of perfume at 27.99
#   1 bottle of perfume at 18.99
#   1 packet of headache pills at 9.75
#   1 box of imported chocolates at 11.25
#     
#   OUTPUT
#     
#   Output 1:
#   1 book : 12.49
#   1 music CD: 16.49
#   1 chocolate bar: 0.85
#   Sales Taxes: 1.50
#   Total: 29.83
#     
#   Output 2:
#   1 imported box of chocolates: 10.50
#   1 imported bottle of perfume: 54.65
#   Sales Taxes: 7.65
#   Total: 65.15
#     
#   Output 3:
#   1 imported bottle of perfume: 32.19
#   1 bottle of perfume: 20.89
#   1 packet of headache pills: 9.75
#   1 imported box of chocolates: 11.85
#   Sales Taxes: 6.70
#   Total: 74.68



