class SkillsController < ApplicationController
  def index
    @skill = Skill.all
  end
end
