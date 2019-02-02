class ShiritoriMessage < ApplicationRecord
    after_create_commit {ShiritoriMessageBroadcastJob.perform_later self}
end
