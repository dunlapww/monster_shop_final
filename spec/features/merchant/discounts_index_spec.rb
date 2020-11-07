require 'rails_helper'

describe 'As a merchant_employee' do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @merchant_2 = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @m_user = @merchant_1.users.create(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')
    @ogre = @merchant_1.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
    @giant = @merchant_1.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 200 )
    @hippo = @merchant_2.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 300 )
    @order_1 = @m_user.orders.create!(status: "pending")
    @order_2 = @m_user.orders.create!(status: "pending")
    @order_3 = @m_user.orders.create!(status: "pending")
    @order_item_1 = @order_1.order_items.create!(item: @hippo, price: @hippo.price, quantity: 2, fulfilled: false)
    @order_item_2 = @order_2.order_items.create!(item: @hippo, price: @hippo.price, quantity: 2, fulfilled: true)
    @order_item_3 = @order_2.order_items.create!(item: @ogre, price: @ogre.price, quantity: 2, fulfilled: false)
    @order_item_4 = @order_3.order_items.create!(item: @giant, price: @giant.price, quantity: 2, fulfilled: false)

    #discounts
    @m1_discount1 = @merchant_1.discounts.create!(item_id: @ogre.id, threshold: 5, discount: 0.1)
    @m1_discount2 = @merchant_1.discounts.create!(item_id: @ogre.id, threshold: 10, discount: 0.15)
    @m1_discount3 = @merchant_1.discounts.create!(item_id: @giant.id, threshold: 20, discount: 0.20)
    @m2_discount1 = @merchant_2.discounts.create!(item_id: @hippo.id, threshold: 10, discount: 0.5)
    
    visit '/login'
    fill_in 'email', with: "#{@m_user.email}"
    fill_in 'password', with: "#{@m_user.password}"
    click_button('Log In')
    click_on('Bulk Discounts')
  end
  describe 'When I visit my discounts page' do
    it 'I see a button to add a new discount that when clicked directs me to a form to enter a discount' do
      require 'pry'; binding.pry
    end
    it 'I see a list of my current discounts' 
    it 'next to each link i see buttons to delete and edit'
  end
end