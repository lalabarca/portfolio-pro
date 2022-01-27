class Skill < ApplicationRecord
  has_many :project_skills
  has_many :projects, through: :project_skills

  has_one_attached :photo

  validates :title, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (1..3) }
end
