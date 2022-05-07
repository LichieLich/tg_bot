require "active_record"

module Models
  class User < ActiveRecord::Base
    validates :name, presence: true
    validates :uid, presence: true

    has_many :requests

    include AASM

    aasm column: :search_chain do
      state :idle, initial: true
      state :new_search

      event :new_search do
        transitions from: :idle, to: :new_search
      end

      event :finish do
        transitions to: :idle
      end
    end
  end
end
