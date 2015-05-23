json.meta do
  json.total @total
end

json.data @regions do |region|
  json.extract! region, :aoguid, :formalname, :shortname
end