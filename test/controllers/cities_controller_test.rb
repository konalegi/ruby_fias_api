require 'test_helper'

class CitiesControllerTest < Endive::Testing::ControllerTestBase

  def test_index
    get '/v1/catalog/fias/cities', { per: 10, page: 2 }
    assert_response :ok
  end

end