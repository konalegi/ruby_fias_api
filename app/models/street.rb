class Street < Sequel::Model(:fias_streets)
  set_primary_key [:aoguid]

  dataset_module do
    def query(q)
      return self unless q
      where("lower(formalname) like lower(?)", q + "%")
    end

    def all_by_parent(q)
      return self unless q
      filter(parentguid: q)
    end

  end

  def longname
    [shortname, formalname].join(' ')
  end
end