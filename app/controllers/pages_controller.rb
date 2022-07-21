class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @skills_design = Skill.where("specialty = ? AND rating = ?", "0", 3).limit(2)
    @skills_web = Skill.where("specialty = ? AND rating = ?", "1", 3)
    @skills_web_standard = Skill.where("specialty = ? AND rating = ?", "1", 2).first

    @projects = Project.order(updated_at: :desc)
  end

  def download_pdf
    send_file(
      "#{Rails.root}/app/assets/cv_hardy_dessources_laura_Front-end_Developper.pdf",
      filename: "cv_hardy_dessources_laura.pdf",
      type: "application/pdf"
    )
  end

end
