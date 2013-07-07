actions :add, :remove

attribute :app_id, :kind_of => String, :name_attribute => true
attribute :environment, :kind_of => String
attribute :cert, :kind_of => String
attribute :timeout, :default => 15

def initialize(*args)
  super
  @action = :add
end
