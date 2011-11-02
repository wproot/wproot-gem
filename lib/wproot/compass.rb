module WPRoot
  class Compass
    def initialize(content)
      @content = content
    end

    def compile
      IO.popen('sass --compass -s', 'w+') do |io|
        io.write(@content)
        io.close_write
        io.read
      end
    end
  end
end
