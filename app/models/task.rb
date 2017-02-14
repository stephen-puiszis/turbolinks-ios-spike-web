class Task < ApplicationRecord

  belongs_to :user

  validates :user, :title, presence: true

end
