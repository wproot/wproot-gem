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
      compile = lambda do |base, relative|
        path = File.join(base, relative)
        dir = File.dirname(path)
        if File.extname(relative) == '.haml'
          new_path = File.join(dir, File.basename(path, '.haml'))
          File.open(new_path, 'w') do |f|
            f.write(Haml.new(File.read(path)).compile)
            puts ">>> Compiled #{path} to #{new_path}"
          end
        elsif File.extname(relative) == '.sass'
          new_path = File.join(dir, File.basename(path, '.sass'))
          File.open(new_path, 'w') do |f|
            f.write(Compass.new(File.read(path)).compile)
            puts ">>> Compiled #{path} to #{new_path}"
          end
        end
      end

      Dir["**/*"].each do |f|
        compile.call(File.dirname(f), File.basename(f))
      end

      FSSM.monitor directory do
        update &compile
        create &compile
      end
    end
  end
end
