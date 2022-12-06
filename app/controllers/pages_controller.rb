class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @skills_design = Skill.where("specialty = ? AND rating = ?", "0", 3).limit(2)
    @skill_adobe_xd = Skill.where("title = ?", "Adobe XD").first
    @skill_figma = Skill.where("title = ?", "Figma").first

    @skills_rails = Skill.where("title = ?", "Rails").first
    @skills_web_standard = Skill.where("specialty = ? AND rating = ?", "1", 2).first

    @projects = Project.order(updated_at: :desc)
    @map = Project.where('id = ?', 1).first

    @behance = [
      {
        url: "https://res.cloudinary.com/dskz4h4td/image/upload/v1670352942/mockup_en2clik_1700_t29i6w.jpg",
        title: "En2clik"
      },
      {
        url: "https://res.cloudinary.com/dskz4h4td/image/upload/v1670353369/mockups_insta_jyrjsw.jpg",
        title: "Martinique Transport"
      },
      {
        url: "https://res.cloudinary.com/dskz4h4td/image/upload/v1670353494/dp_mockup_1700_hs4ui2.jpg",
        title: "Club Ti Chimen"
      }
    ]
  end

  def download_pdf
    send_file(
      "#{Rails.root}/app/assets/cv_hardy_dessources_laura_Fullstack_Developper.pdf",
      filename: "cv_Hardy_Dessources_Laura_Fullstack_developper.pdf",
      type: "application/pdf"
    )
  end

end
