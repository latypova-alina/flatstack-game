class ApplicationDecorator < Draper::Decorator
  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def method_missing(sym, *args, &block)
    object.public_send sym, *args, &block
  end
end
