class Sale < ActiveRecord::Base
  has_many :sale_items
  before_save :calculate_value_and_date

  def self.build_from_sale_items(sale_items)
    new_sale = Sale.new
    sale_items.each do |sale_item|
      new_sale.sale_items << SaleItem.new(sale_item)
    end
    new_sale
  end

  private
  def calculate_value_and_date
    self.date = Time.now
    self.value = 0
    self.sale_items.each do |item|
      self.value = self.value + (item.value * item.quantity)
    end
  end
end