module Drawr
  VERSION = '1.0.0'
  class Base
    attr_accessor :title
    attr_accessor :hide_dots
    attr_accessor :div
    attr_accessor :theme

    # A hash of names for the individual columns, where the key is the array
    # index for the column this label represents.
    attr_accessor :labels

    def data(name, data_points = [], color = nil)
      @data_points[name] = data_points
    end

    def initialize(target_width = 800)
      @data_points = {}
      @theme = {
        :background_color => '#dbdbdb',
        :color_scheme     => 'red',
        :padding          => 'left: 30, right: 0, top: 10, bottom: 30',
      }
      @extra_options = {}
      if target_width.is_a? String
        @width, @height = target_width.split(/x/, 2)
      else
        @width, @height = target_width, (target_width * (3.0/4.0))
      end
      @div = 'plotr'
    end

    def write_to_div(div)
      @div = div
      to_s
    end

    def write(file); File.open(file, 'wb') { |f| f.write to_s }; end

    def to_s
      <<END
      <div><canvas id="#{div}" height="#{@height.to_i}" width="#{@width.to_i}"></canvas></div>
      <script>#{dataset}\n#{options}\n#{commands}</script>
END
    end

    protected
    def dataset
      "var dataset = {\n" +
      @data_points.map { |k, v|
        values = []
        v.each_with_index { |value, i| values << "[#{i}, #{value}]" }
        "'#{k.to_s.gsub(/'/,"\\\\'")}': [#{values.join(', ')}]"
      }.join(",\n") + "\n};\n"
    end

    def options
      opts = @extra_options.map { |k,v| "#{k}: #{v}" }
      opts << "padding: { #{@theme[:padding]} }"
      opts << "backgroundColor: '#{@theme[:background_color]}'"
      opts << "colorScheme: '#{@theme[:color_scheme]}'"

      "var options = {\n" +
      opts.join(",\n") + ",\n" +
      "xTicks: [\n" +
      labels.keys.sort.map { |k|
        "{v:#{k}, label:'#{labels[k].to_s.gsub(/'/, "\\\\'")}'}"
      }.join(",\n") +
      "\n]\n};\n"

    end

    def commands
      "var chart = new Plotr.#{class_name}('#{div}', options);\n" +
      "chart.addDataset(dataset);\nchart.render();\n"
    end
  end

  class Pie < Base
    def initialize(target_width = 800)
      super(target_width)
      @extra_options[:strokewidth] = 1
    end

    def data(name, data_points = [], color = nil)
      @labels ||= {}
      @labels[@labels.length] = name
      super(name, data_points, color)
    end

    protected
    def dataset
      <<END
  var dataset = {
      '#{title.to_s.gsub(/'/, "\\\\'")}': [#{@labels.map { |k,v| "[#{k}, #{@data_points[v].first}]"
      }.join(', ')}]
  };
END
    end

    def class_name
      'PieChart'
    end
  end

  class Line < Base
    protected
    def class_name
      'LineChart'
    end
  end

  class Bar < Base
    protected
    def class_name
      'BarChart'
    end
  end
end
