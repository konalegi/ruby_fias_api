json.meta do
  json.total @total
end


json.data @cities do |city|
  json.extract! city, :aoguid, :formalname, :shortname
  if city.region.present?
    json.region_name city.region.formalname
    json.region do
      json.extract! city.region, :aolevel, :aoguid, :formalname, :offname, :parentguid, :shortname
    end
  end
end

