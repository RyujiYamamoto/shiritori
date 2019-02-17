class ShiritoriMessage < ApplicationRecord
    HIRAGANA_REGEX = /\A[ぁ-んー－]+\z/
    validates :body, presence: true,
                     format: {with: HIRAGANA_REGEX}
    after_create_commit {ShiritoriMessageBroadcastJob.perform_later self}
    
    belongs_to :room, optional: true
    belongs_to :user
    def user_name
        return '名無しり' if user_id.blank?
        user.name
    end
end
