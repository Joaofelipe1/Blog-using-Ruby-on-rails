class Post < ApplicationRecord

    belongs_to :user
    has_one_attached :thumbnail
    has_one_attached :banner
    has_rich_text :body
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 5}
    validates :body, presence: true, length: { minimum: 10}
    validates :banner, presence:true
    validates :thumbnail, presence:true


    self.per_page = 4

    def optimized_image(image,x,y)
        return image.variant(resize_to_fill: [x,y]).processed
    end
end
