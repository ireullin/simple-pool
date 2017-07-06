require 'thread'

class SimplePool
    def initialize(thread_num)
        @kill = false
        @stop = false
        @q = Queue.new
        @m = Mutex.new
        @cv = ConditionVariable.new
        @threads = []
        thread_num.times do |i|
            @threads << Thread.new{round_n_round}
        end
    end

    def invoke(&callback)
        @q << callback
        @m.synchronize{ @cv.broadcast }
    end

    def kill_right_now
        @kill = true
        @m.synchronize{ @cv.broadcast }
        @threads.each{|t| t.join}
    end

    def wait_until_finish
        @stop = true
        @m.synchronize{ @cv.broadcast }
        @threads.each{|t| t.join}
    end

    def do_it
        begin
            callback = @q.pop
            callback.call
        rescue

        end
    end

    def round_n_round
        until @kill do
            unless @q.empty?
                do_it
                next
            end

            if @stop
                @kill = true
                next
            end

            @m.synchronize{ @cv.wait(@m, 1) }
        end
    end
end

