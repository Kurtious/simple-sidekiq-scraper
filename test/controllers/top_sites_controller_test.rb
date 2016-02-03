require 'test_helper'

class TopSitesControllerTest < ActionController::TestCase
  setup do
    @top_site = top_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_site" do
    assert_difference('TopSite.count') do
      post :create, top_site: { name: @top_site.name, ordering: @top_site.ordering, rank: @top_site.rank, url: @top_site.url }
    end

    assert_redirected_to top_site_path(assigns(:top_site))
  end

  test "should show top_site" do
    get :show, id: @top_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_site
    assert_response :success
  end

  test "should update top_site" do
    patch :update, id: @top_site, top_site: { name: @top_site.name, ordering: @top_site.ordering, rank: @top_site.rank, url: @top_site.url }
    assert_redirected_to top_site_path(assigns(:top_site))
  end

  test "should destroy top_site" do
    assert_difference('TopSite.count', -1) do
      delete :destroy, id: @top_site
    end

    assert_redirected_to top_sites_path
  end
end
