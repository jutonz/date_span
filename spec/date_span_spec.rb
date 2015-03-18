require 'rspec'

require_relative '../date_span'

RSpec.describe DateSpan, '#pluralize' do
  it 'converts (2000, 2001) to 2000-1' do
    expect(DateSpan.pluralize(2000, 2001)).to eq '2000-1'
  end

  it 'converts (2009, 2014) to 2009-14' do
    expect(DateSpan.pluralize(2009, 2014)).to eq '2009-14'
  end

  it 'converts (2000, 2000) to 2000' do
    expect(DateSpan.pluralize(2000, 2000)).to eq '2000'
  end

  it 'returns nil if start_date > end_date' do
    expect(DateSpan.pluralize(2000, 1999)).to eq nil
  end

  it 'converts (1800, 2005) to 1800-2005' do
    expect(DateSpan.pluralize(1800, 2005)).to eq '1800-2005'
  end
end

RSpec.describe DateSpan, '#singularize' do

  it 'converts 2000-0 to [2000, 2000]' do
    expect(DateSpan.singularize('2000-0')).to eq [2000, 2000]
  end

  it 'converts 2008-9 to [2008, 2009]' do
    expect(DateSpan.singularize('2008-9')).to eq [2008, 2009]
  end

  it 'converts 2009-10 to [2009, 2010]' do
    expect(DateSpan.singularize('2009-10')).to eq [2009, 2010]
  end

  it 'converts 1884-992 to [1884, 1992]' do
    expect(DateSpan.singularize('1884-992')).to eq [1884, 1992]
  end

  it 'converts 1800-2005 to [1800, 2005]' do
    expect(DateSpan.singularize('1800-2005')).to eq [1800, 2005]
  end

  it 'raises a RuntimeError if no hyphen is present' do 
    begin
      DateSpan.singularize('2000')
    rescue RuntimeError => e
      expect(e.message).to eq 'The passed date span must contain a hyphen'
    end
  end
end