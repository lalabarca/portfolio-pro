class Project < ApplicationRecord
  has_rich_text :description
  has_rich_text :collaborator_desc
  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills

  validates :title, :finished, :date_start, presence: true

  has_many_attached :photos
end
