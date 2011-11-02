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
          glob '**/*.php.haml'

          compile = lambda do |base, relative|
            path = File.join(base, relative)
            dir = File.dirname(path)
            new_path = File.join(dir, File.basename(path, '.haml'))
            File.open(new_path, 'w') do |f|
              f.write(Haml.new(File.read(path)).compile)
              puts ">>> Compiled #{path} to #{new_path}"
            end
          end
          update &compile
          create &compile
        end

        path directory do
          glob '**/*.css.sass'

          compile = lambda do |base, relative|
            path = File.join(base, relative)
            dir = File.dirname(path)
            new_path = File.join(dir, File.basename(path, '.sass'))
            File.open(new_path, 'w') do |f|
              f.write(Compass.new(File.read(path)).compile)
              puts ">>> Compiled #{path} to #{new_path}"
            end
          end
          update &compile
          create &compile
        end

      end
    end
  end
end
