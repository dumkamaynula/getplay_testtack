require 'test_helper'

class ProductionTrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_tracking = production_trackings(:one)
  end

  test "should get index" do
    get production_trackings_url
    assert_response :success
  end

  test "should get new" do
    get new_production_tracking_url
    assert_response :success
  end

  test "should create production_tracking" do
    assert_difference('ProductionTracking.count') do
      post production_trackings_url, params: { production_tracking: { composer_id: @production_tracking.composer_id, designer_id: @production_tracking.designer_id, developer_id: @production_tracking.developer_id, game_id: @production_tracking.game_id, illustrator_id: @production_tracking.illustrator_id, live: @production_tracking.live, writer_id: @production_tracking.writer_id } }
    end

    assert_redirected_to production_tracking_url(ProductionTracking.last)
  end

  test "should show production_tracking" do
    get production_tracking_url(@production_tracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_tracking_url(@production_tracking)
    assert_response :success
  end

  test "should update production_tracking" do
    patch production_tracking_url(@production_tracking), params: { production_tracking: { composer_id: @production_tracking.composer_id, designer_id: @production_tracking.designer_id, developer_id: @production_tracking.developer_id, game_id: @production_tracking.game_id, illustrator_id: @production_tracking.illustrator_id, live: @production_tracking.live, writer_id: @production_tracking.writer_id } }
    assert_redirected_to production_tracking_url(@production_tracking)
  end

  test "should destroy production_tracking" do
    assert_difference('ProductionTracking.count', -1) do
      delete production_tracking_url(@production_tracking)
    end

    assert_redirected_to production_trackings_url
  end
end
