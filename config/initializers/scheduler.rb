require 'rufus-scheduler'

unless Rails.env.test?
  scheduler = Rufus::Scheduler.new

  scheduler.every '15m', first_in: '5s' do
    Rails.logger.info "Beginning FitBit update at #{Time.now}"

    config = begin
      yaml_template = ERB.new(File.new('.fitgem.yml.erb').read)
      Fitgem::Client.symbolize_keys(YAML.load( yaml_template.result  ))
    rescue ArgumentError => e
      raise "Could not parse FitGem YAML: #{e.message}"
    end

    client = Fitgem::Client.new(config[:oauth])

    if config[:oauth][:token] && config[:oauth][:secret]
      begin
        client.reconnect(config[:oauth][:token], config[:oauth][:secret])
      rescue Exception => e
        raise 'Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml'
      end

      begin
        summary = client.activities_on_date('today')['summary']
      rescue Exception => e
        raise "Error getting the latest activities: #{e.message}"
      end


      if summary.nil?
        raise "FitBit 'summary' element not found. Received: #{summary}"
      end

      previous_stats = FitBitStats.last

      steps = summary['steps']
      floors = summary['floors']

      should_update = new_stats?(previous_stats: previous_stats, steps: steps, floors: floors)

      FitBitStats.create(steps: steps, floors: floors) if should_update

      Rails.logger.info should_update ? "Updated FitBit stats with:\n  Steps: #{steps}\n  Floors: #{floors}" : "Did not update FitBit stats..."
    else
      raise 'Missing oath token and secret. Please set these up and try again.'
    end
  end

  def new_stats?(previous_stats:, steps:, floors:)
    if previous_stats.nil? || steps.nil? || floors.nil? || previous_stats.steps == steps || previous_stats.floors == floors
      false
    else
      true
    end
  end
end
