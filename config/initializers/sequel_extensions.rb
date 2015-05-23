module SequelPagination
  def page(page = 0)
    page = (page || 0).to_i
    offset(page)
  end

  def per(per_page = 10)
    per_page = (per_page || 10).to_i
    limit(per_page)
  end
end

class Sequel::Model
  extend SequelPagination
end

class Sequel::Dataset
  include SequelPagination
end