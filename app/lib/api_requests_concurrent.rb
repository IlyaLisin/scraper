# frozen_string_literal: true

class ApiRequestsConcurrent
  def initialize(delay: 0, batch: 50)
    @delay = delay
    @batch = batch
    @requests = []
  end

  def <<(request)
    @requests << request
  end

  def perform_all
    results = []
    mutex = Mutex.new
    @requests.each_slice(@batch) do |batch|
      threads = []
      batch.each do |request|
        threads << Thread.new do
          begin
            response = Faraday.get(request.uri)
          rescue StandardError => e
            App::Api::Sites.logger.error(e)
            next
          end
          mutex.synchronize do
            results << { id: request.id, response: response }
          end
        end
        sleep @delay if @delay.positive?
      end
      threads.each(&:join)
    end
    results
  end
end
