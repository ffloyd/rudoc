module RuDoc
  ParamDoc = Struct.new(
    :name,
    :kind, # like in a Method#parameters : req, keyreq, rest, keyrest, block
    :type, # just a string for now
    :documentation
  )
end
