class Idea < ActiveRecord::Base
  default_scope -> { where is_deleted: false }
  default_scope -> { order :order => :desc }
  
  def self.with_order_more_than(value)
    where '"order" > ?', value
  end
  
  
  after_initialize :set_defaults
  
  def move(direction)
    new_order = direction == "up" ? self.order + 1 : self.order - 1
    other_idea = Idea.find_by_order new_order
    swap_order_with other_idea, new_order unless other_idea.nil?
  end
  
  def delete_and_reorder
    old_order = self.order
    self.update is_deleted: true, order: 0
    Idea.all.with_order_more_than(old_order).each do |idea|
      idea.update order: idea.order - 1
    end
  end
  
  private
    def set_defaults
      if self.order.nil?
        self.order = 0
      end
    end
    
    def swap_order_with(other_idea, new_order)
      other_idea.update order: self.order
      self.update order: new_order
    end
end
