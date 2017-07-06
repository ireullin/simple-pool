require 'simple-pool'

pool = SimplePool.new(100)
10000.times do |task_num|
    pool.invoke do
        puts "#{Thread.current.object_id} is doing task #{task_num}"
        sleep(0.5)
    end
end

pool.wait_until_finish

