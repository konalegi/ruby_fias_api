json.meta do
  json.total @total
end

json.data @streets do |street|
  json.extract! street, :aoguid, :formalname, :shortname, :longname
end