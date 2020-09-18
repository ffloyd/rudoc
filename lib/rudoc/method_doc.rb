module Rudoc
  MethodDoc = Struct.new(
    :subject,
    :short_description,
    :documentation,
    :param_docs,
    keyword_init: true
  )
end
