class Post < ActiveRecord::Base
  belongs_to :user
  validates :content, :presence => true
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.vote = 0
  end

end
