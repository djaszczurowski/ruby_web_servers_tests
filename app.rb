require "sinatra"

class App < Sinatra::Base
  use Rack::CommonLogger
  helpers do
    def logger
      request.logger
    end
  end

  get '/slow_IO' do
    sleep(5)

    "slow_IO OK"
  end

  get '/fast_CPU' do
    100 * 100

    "fast_CPU OK"
  end

  get '/both_CPU_and_IO' do
    sleep(3)

    sum = 0
    (1..75).each do |i|
      (1..75).each do |j|
        (1..75).each do |k|
          sum += i * j * k
        end
      end
    end    
    
    'OK'    
  end

  get '/slow_cpu' do
    sum = 0

    (1..250).each do |i|
      (1..250).each do |j|
        (1..250).each do |k|
          sum += i * j * k
        end
      end
    end

    sum.to_s
  end
end