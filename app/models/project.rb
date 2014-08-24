class Project

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :key,  type: String

  has_many :events
  has_many :tracelogs

end
