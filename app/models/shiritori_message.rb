class ShiritoriMessage < ApplicationRecord
    HIRAGANA_REGEX = /\A[ぁ-んー－]+\z/
    validates :body, presence: {message: "なにも入力されてないよ！"},
                     format: {with: HIRAGANA_REGEX, message: "ひらがなでしりとってね！"}
    after_create_commit {ShiritoriMessageBroadcastJob.perform_later self}
    
    belongs_to :room, optional: true
    belongs_to :user
    def user_name
        return '名無しり' if user_id.blank?
        user.name
    end
end
