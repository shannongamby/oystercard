require 'journey'

describe Journey do
  let (:station) { double :station}
  let (:station_2) { double :station}
  let (:subject) {Journey.new}

  context 'before a journey starts' do
    it 'should not have an entry station before starting journey' do
      expect(subject.entry_station).to eq nil
    end
  end

  context 'once in journey' do
    it 'stores the entry station after touch in' do
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  context 'after journey' do
    it 'forgets the entry station on touch out' do
      subject.touch_in(station)
      subject.touch_out(station_2)
      expect(subject.entry_station).to eq nil 
    end
  end


end
