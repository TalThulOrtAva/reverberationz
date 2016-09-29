require 'redis'

class DatabaseAccessor
  def initialize
    @redis = Redis.new
  end

  def get(key)
    @redis.hgetall(key)
  end

  def set(key, hash)
    @redis.mapped_hmset(key, hash)
  end

  # lol redis is a silly choice for this app but w/e
  def get_all
    @redis.keys('*').inject([]){ |memo, x| memo << @redis.hgetall(x) }
  end
end
