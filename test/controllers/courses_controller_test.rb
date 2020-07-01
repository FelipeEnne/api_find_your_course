require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test 'should get index' do
    get courses_url, as: :json
    assert_response :success
  end

  test 'should show course' do
    get course_url(@course), as: :json
    assert_response :success
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete course_url(@course), as: :json
    end

    assert_response 204
  end
end
