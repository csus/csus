class Review < ActiveRecord::Base
  # associations
  belongs_to :system
  belongs_to :trust
  belongs_to :user

  has_many :csus_scores, dependent: :destroy
  accepts_nested_attributes_for :csus_scores, allow_destroy: true

  has_many :sus_scores, dependent: :destroy
  accepts_nested_attributes_for :sus_scores, allow_destroy: true

  # validations
  validates :review_positive_text, :review_negative_text, presence: true

  # imports trust data from a CSV file initially for testing but also possibly for admin use
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        Review.create! row.to_hash
      rescue
        puts row
      end
    end
  end
end
