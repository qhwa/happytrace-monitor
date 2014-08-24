class Event

  include Mongoid::Document
  include Mongoid::Timestamps

  # 用户标志，安全方面考虑后，不存储 user_id
  field :user,      type: String

  # 用户做的操作
  field :user_action,    type: String

  # 用户客户端的信息
  field :geo_region,  type: String
  field :client_id,   type: String
  field :ip,          type: String

  field :tracelog_id, type: Integer
  field :project_id,  type: Integer
  #field :event_group_id, type: Integer

  belongs_to :tracelog
  belongs_to :project
  #belongs_to :event_group

  validates_presence_of :tracelog, :ip, :client_id, :user_action
end
