module Rudoc
  SingletonDoc = Struct.new(
    :subject,
    :method_docs,
    keyword_init: true
  )
end
