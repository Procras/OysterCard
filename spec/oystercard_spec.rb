require 'oystercard'

describe Oystercard do

  describe 'Oystercard transactions' do

    it 'balance' do
    expect(subject).to respond_to :balance
    end

    it 'tops up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'has an upper limit' do
      max_limit = Oystercard::MAX_LIMIT
      subject.top_up max_limit
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of £#{max_limit} exceeded"
    end

    it 'allows you to deduct from the balance' do
      subject.top_up(10)
      fare = 5
      expect{ subject.deduct(3) }.to change{ subject.balance }.by -3
    end
  end

  describe ' Journey ' do

    it 'allows touch in' do
      expect(subject).to respond_to :touch_in
    end

    it ' verifies journey' do

      expect(subject.touch_in).to eq true
    end
  end
end
