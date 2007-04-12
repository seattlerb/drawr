require 'test/unit'
require 'drawr'

class TestDrawr < Test::Unit::TestCase
  def test_bar
    drawr = Drawr::Bar.new(400)
    drawr.title = 'Awesomeness'
    drawr.data(:One,    [1,2,3])
    drawr.data('Two',   [2,3,1])
    drawr.data(:Three,  [3,1,2])
    drawr.labels = {
      0 => 'one',
      1 => 'two',
      2 => 'three',
    }
    value = drawr.to_s
    %w{ one two three }.each_with_index do |v,i|
      assert(value =~ /v:#{i}, label:'#{v}'/)
    end
    assert(value =~ /Plotr.BarChart/)
    assert(value =~ /height="300"/)
    assert(value =~ /width="400"/)
    assert(value =~ /'One': \[\[0, 1\], \[1, 2\], \[2, 3\]\]/)
    assert(value =~ /'Two': \[\[0, 2\], \[1, 3\], \[2, 1\]\]/)
    assert(value =~ /'Three': \[\[0, 3\], \[1, 1\], \[2, 2\]\]/)
  end

  def test_line
    drawr = Drawr::Line.new(400)
    drawr.title = 'Awesomeness'
    drawr.data(:One,    [1,2,3])
    drawr.data('Two',   [2,3,1])
    drawr.data(:Three,  [3,1,2])
    drawr.labels = {
      0 => 'one',
      1 => 'two',
      2 => 'three',
    }
    value = drawr.to_s
    %w{ one two three }.each_with_index do |v,i|
      assert(value =~ /v:#{i}, label:'#{v}'/)
    end
    assert(value =~ /Plotr.LineChart/)
    assert(value =~ /height="300"/)
    assert(value =~ /width="400"/)
    assert(value =~ /'One': \[\[0, 1\], \[1, 2\], \[2, 3\]\]/)
    assert(value =~ /'Two': \[\[0, 2\], \[1, 3\], \[2, 1\]\]/)
    assert(value =~ /'Three': \[\[0, 3\], \[1, 1\], \[2, 2\]\]/)
  end

  def test_pie
    drawr = Drawr::Pie.new
    drawr.title = 'Awesomeness'
    drawr.data(:One,    [1])
    drawr.data('Two',   [2])
    drawr.data(:Three,  [2])

    value = drawr.to_s
    %w{ One Two Three }.each_with_index do |v,i|
      assert(value =~ /v:#{i}, label:'#{v}'/)
    end
    assert(value =~ /Plotr.PieChart/)
    assert(value =~ /'Awesomeness': \[\[0, 1\], \[1, 2\], \[2, 2\]\]/)
  end
end
