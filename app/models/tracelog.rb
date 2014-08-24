class Tracelog
  
  include Mongoid::Document

  field :raw_json, type: Hash
  field :remote_ip, type: String
  field :client_id, type: String
  field :project_id, type: Integer

  belongs_to :project
  has_many :events
  #has_many :alarms

  validates_presence_of :remote_ip, :client_id, :project

  after_create :create_event, if: -> { raw_json }

  def create_event
    action = raw_json['action']
    user   = raw_json['user']
    if action
      Event.create(
        user_action:  action,
        user:         user,
        client_id:    client_id,
        ip:           remote_ip,
        tracelog:     self,
        project:      project
      )
    end
  end

end
