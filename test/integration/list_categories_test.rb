require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "one")
        @category2 = Category.create(name: "two")
    end

    test "should show categories listimg" do
        get categories_path
        assert_template 'categories/index'
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
    end

end