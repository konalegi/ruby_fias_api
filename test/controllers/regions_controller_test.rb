require 'test_helper'

class RegionsControllerTest < Endive::Testing::ControllerTestBase

  def test_index
    get '/v1/catalog/fias/regions', { per: 10, page: 2 }
    assert_response :ok
  end

end