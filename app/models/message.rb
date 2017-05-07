class Message < ActiveRecord::Base
    
    validates :number, presence: true
    validates :text, presence: true

end
