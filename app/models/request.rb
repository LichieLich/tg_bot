require "active_record"

module Models
  class Request < ActiveRecord::Base
    validates :value, presence: true
    belongs_to :user
  end
end
