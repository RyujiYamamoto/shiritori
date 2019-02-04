class ShiritoriMessage < ApplicationRecord
    validates :body, presence: true
    after_create_commit {ShiritoriMessageBroadcastJob.perform_later self}
    
    belongs_to :user
    def user_name
        return '名無しり' if user_id.blank?
        user.name
    end
    

        
end
