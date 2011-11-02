module WPRoot
  class CLI
    def initialize(argv)
      case argv.shift
      when 'watch'
        watch File.expand_path('.')
      end
    end

    def watch(directory)
      puts "Watching #{directory}"
      FSSM.monitor do
        path directory do
          glob '*.php.haml'

          compile = lambda do |base, relative|
          end
          update &compile
          create &compile
        end

        path directory do
          glob '*.css.sass'

          compile = lambda do |base, relative|
          end
          update &compile
          create &compile
        end

      end
    end
  end
end
