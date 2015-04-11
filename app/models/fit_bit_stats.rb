# @author Matthew Rayner
# @since 0.1
class FitBitStats < ActiveRecord::Base
  validates :steps,
            :floors,
            presence: {
              message: I18n.t('.fit_bt_stats.steps_floors_validation')
            }

  scope :ordered_by_age, -> { order(created_at: :desc) }
end
