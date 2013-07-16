require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
 test "product should have a positive price" do
   product=Product.new(
       :title=>'new product',
       :description=>'yyyy',
       :image_url=>'xyz.jpg'
   )
   product.price=-1
   assert product.invalid?
   assert_equal "must be greater than or equal to 0.01",product.errors[:price].join('; ')

   product.price=0
   assert product.invalid?
   assert_equal "must be greater than or equal to 0.01",product.errors[:price].join('; ')

   product.price=1
   assert product.valid?
 end
  def new_product(image_url)
    Product.new(
        :title=>'new product123',
        :description=>'new description',
        :price=>0.11,
        :image_url=>image_url

    )
  end

    test "image url" do

      ok=ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg FRED.Jpeg fred.jpeg http://a.b.c/x/y/z/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more}
      ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"
      end
      bad.each do |name|
        assert new_product(name).invalid?, "#{name} shouldn't be valid"
        end
    end


end
