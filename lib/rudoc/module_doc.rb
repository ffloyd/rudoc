module Rudoc
  ModuleDoc = Struct.new(
    :subject,
    :short_description,
    :documentation,
    :method_docs,
    :singleton_doc,
    keyword_init: true
  ) do
    def initialize(subject:, method_docs: [], **rest)
      singleton_doc = ::RuDoc::SingletonDoc.new(subject: subject.singleton_class)
      super(subject: subject, method_docs: method_docs, singleton_doc: singleton_doc, **rest)
    end
  end
end
