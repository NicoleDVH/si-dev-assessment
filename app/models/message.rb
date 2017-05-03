class Message < ActiveRecord::Base
    belongs_to :user
    validates :number, presence: true
    validates :text, presence: true
end
