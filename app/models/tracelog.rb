class Tracelog
  
  include Mongoid::Document

  field :raw_json, type: Hash
  field :remote_ip, type: String
  field :client_id, type: String

  has_many :events
  has_many :alarms

end
