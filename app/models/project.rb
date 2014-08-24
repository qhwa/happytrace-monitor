class Project

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :key,  type: String

end
