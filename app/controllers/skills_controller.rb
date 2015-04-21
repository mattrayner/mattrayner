# Allow the user to see skills.
#
# @author Matthew Rayner
# @since 0.2
class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
end
