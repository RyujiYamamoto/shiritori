class Room < ApplicationRecord
    belongs_to :host_user, class_name: "User", foreign_key: 'host_user_id'
    belongs_to :guest_user, class_name: "User", foreign_key: 'guest_user_id', optional: true
    has_many :shiritori_messages
    validates :name, uniqueness: {message: "「%{value}」はすでに存在します"}
    validates :host_user_id, uniqueness: {message: "同時に作れる部屋は一つまでです"}
end
