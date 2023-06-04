require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = FactoryBot.create(:test_user, email: "unique@example.com", password: "password123")
    sign_in @user
  end

  test 'render a list of products' do
    # Perform any necessary setup or actions
    get categories_path
  
    assert_response :success
    # Add assertions to verify the expected behavior
    assert_select 'h6', 'Categorías'  # Example assertion: Check if the page contains an h1 tag with the content 'Products'
  end


  test 'render category detail' do
    get categories_path(categories(:one).id)

    assert_response :success
  end

  # def teardown
  #   User.destroy_all
  # end

  # def teardown
  #   User.delete_all
  # end
end