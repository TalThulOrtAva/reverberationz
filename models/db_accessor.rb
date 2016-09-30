require 'redis'
require 'os'

class DBAccessor
  def initialize
    @redis = Redis.new
  end

  def get_customer(key)
    db_entry = @redis.get(key)
    !db_entry.nil? ? Marshal.load(db_entry) : nil
  end

  def set_customer(customer)
    @redis.set(customer.email, Marshal.dump(customer))
  end

  def get_all_customers # this sucks but it'll spark a conversation about redis strategy and use cases
    @redis.keys('*@*').inject([]) { |customers, x| customers << @redis.get(x) }.map { |customer| Marshal.load(customer) }
  end

  def expire_customer(key)
    @redis.expire(key, 0)
  end

  def flush_all # (lazy prod protection just to show it was a concern)
    @redis.FLUSHALL if OS.osx? || OS.windows?
  end
end
