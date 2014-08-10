class Idea < ActiveRecord::Base
  default_scope -> { where is_deleted: false }
end
