class Region < Sequel::Model(:fias_regions)
  set_primary_key [:aoguid]

  dataset_module do
    def query(q)
      return self unless q
      where("lower(formalname) like lower(?)", q + "%")
    end
  end
end