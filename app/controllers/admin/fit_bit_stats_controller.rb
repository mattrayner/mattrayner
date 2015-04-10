class Admin::FitBitStatsController < Admin::BaseController
  def index
    @fit_bit_stats = FitBitStats.last

    @fit_bit_history = FitBitStats.order(created_at: :desc).limit(20).offset(1)
  end
end
