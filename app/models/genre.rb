class Genre < ApplicationRecord
    has_many :items, dependent: :destroy

    validates :name, presence: true

    # include ActiveModel::Model
    # include ActiveModel::Attributes

    # attribute :body, :string

end
