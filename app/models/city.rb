class City < Sequel::Model(:fias_cities)
  set_primary_key [:aoguid]

  dataset_module do
    def query(q)
      return self unless q
      where("lower(formalname) like lower(?)", q + "%")
    end

    def all_by_region(q)
      return self unless q
      filter(parentguid: q)
    end
  end

  def self.preset
    where(formalname: ["Москва", "Санкт-Петербург", "Казань", "Екатеринбург",
          "Нижний Новгород", "Волгоград", "Владивосток", "Хабаровск",
          "Калининград", "Краснодар", "Красноярск", "Новосибирск", "Самара"]).order(:ordering)
  end

  def region
    area = Area[parentguid]
    area.present? ? Region[area.parentguid] : Region[parentguid]
  end
end