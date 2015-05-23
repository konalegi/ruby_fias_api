require 'test_helper'

class StreetsControllerTest < Endive::Testing::ControllerTestBase

  def test_index
    get '/v1/catalog/fias/streets', { per: 10, page: 2 }
    assert_response :ok
  end

end