class ShiritoriMessage < ApplicationRecord
    validates :message, presence: true
    after_create_commit {ShiritoriMessageBroadcastJob.perform_later self}
end
