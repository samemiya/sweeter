class Sweet < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { maximum: 140 }
    # belongs_to :user
end
