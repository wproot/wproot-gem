module WPRoot
  class Haml
    def initialize(content)
      @content = content
    end

    def compile
      IO.popen(['php', File.expand_path('../../../vendor/HamlPHP.php', __FILE__)], 'w+') do |io|
        io.write(@content)
        io.close_write
        io.read
      end
    end
  end
end
