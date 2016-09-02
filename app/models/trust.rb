class Trust < ActiveRecord::Base
  require 'csv'
  # associations
  has_many :trust_systems
  has_many :systems, :through => :trust_systems

  # validations
  validates :trust_legal_name, presence: true
  validates :trust_nhs_code, presence: true
  validates :trust_number, presence: true

  # imports trust data from a CSV file initially for testing but also possibly for admin use
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        Trust.create! row.to_hash
      rescue
        puts row
      end
    end
  end

end
