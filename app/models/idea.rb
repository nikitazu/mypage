class Idea < ActiveRecord::Base
  default_scope -> { where is_deleted: false }
  default_scope -> { order :order => :asc }
end
