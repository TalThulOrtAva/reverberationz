require File.dirname(__FILE__) + '/spec_helper'

# I think it would be ridic silly to use redis for this, but
# whatever, I'm just gonna use it b/c it was in the ad
describe DatabaseAccessor do
  let(:accessor){ DatabaseAccessor.new }
  let(:key)  { 'The@Fragile.nin' }
  let(:value)  { {name: 'JustLikeYouImagined'} }

  describe '#set/#get' do
    it 'sets a record in redis, then gets it' do
      accessor.set(key, value)
      expect { accessor.get(key)}.to eq value
    end
  end

  describe '#expire' do
    it 'can expire a key' do
      accessor.expire(key)
      expect { accessor.get(key)}.to be_nil
    end
  end

  describe '#get_all' do
    it 'returns all entries in the db' do
      accessor.set(1,2)
      accessor.set(3,4)
      accessor.set(5,6)
      expect{accessor.get_all}.to include? %w(2 4 6)
    end
  end
end
