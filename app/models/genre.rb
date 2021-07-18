class Genre < ApplicationRecord
    has_many :items, dependent: :destroy

    enum genre:{
     ケーキ: 0,
     プリン: 1,
     焼き菓子: 2,
     キャンディ: 3
    }
    validates :name, presence: true

    # include ActiveModel::Model
    # include ActiveModel::Attributes

    # attribute :body, :string

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
