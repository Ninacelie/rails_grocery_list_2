class ListItem < ApplicationRecord

  belongs_to :list
  belongs_to :item

  scope :complete_items, -> { where(completed: true) }
  scope :incomplete_items, -> { where(completed: false) }

end
