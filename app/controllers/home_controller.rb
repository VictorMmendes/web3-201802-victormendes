class HomeController < ApplicationController
  def index
    totalPurchases = 0
    totalPurchasesValue = 0
    @purchases = Purchase.all
    @purchases.each do |purchase|
      totalPurchasesValue += purchase.total_price
      totalPurchases += 1
    end

    totalSales = 0
    totalSalesValue = 0
    @sales = Sale.all
    @sales.each do |sale|
      totalSalesValue += sale.total_price
      totalSales += 1
    end

    @profit = Hash.new
    @profit["total_purchases"] = totalPurchases
    @profit["purchases"] = totalPurchasesValue
    @profit["total_sales"] = totalSales
    @profit["sales"] = totalSalesValue
    @profit["profit"] = totalSalesValue - totalPurchasesValue

    return @profit, @sales, @purchases
  end
end
