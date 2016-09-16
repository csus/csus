class Review < ActiveRecord::Base
  # associations
  belongs_to :system
  belongs_to :trust
  belongs_to :user

  has_many :sus_scores
  accepts_nested_attributes_for :sus_scores, allow_destroy: true

  # validations

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
