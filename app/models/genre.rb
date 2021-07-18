class Genre < ApplicationRecord
    has_many :items, dependent: :destroy
    validates :name, presence: true
    
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :body, :string

  def self.search_for(content, method)
    if method == 'perfect'
      Genre.where(title: content)
    elsif method == 'forward'
      Genre.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Genre.where('title LIKE ?', '%'+content)
    else
      Genre.where('title LIKE ?', '%'+content+'%')
    end
  end
end
