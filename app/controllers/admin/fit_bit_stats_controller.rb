module Admin
  # Allow a user to view the current FitBit stats on the server, as well as
  # inspect the recent value history.
  #
  # @author Matthew Rayner
  # @since 0.1
  class FitBitStatsController < Admin::BaseController
    def index
      @fit_bit_stats = FitBitStats.last

      @fit_bit_history = FitBitStats.ordered_by_age.limit(20).offset(1)
    end
  end
end
