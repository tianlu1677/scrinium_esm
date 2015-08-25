desc "Install scrinium_esm into host application"
namespace :scrinium_esm do
  task :install do
    scrinium_root = FileUtils.pwd
    spec = Gem::Specification.find_by_name 'scrinium_esm'
    scrinium_esm_root = spec.gem_dir
    # Remove any existed migrate files.
    Dir["#{scrinium_root}/db/migrate/*scrinium_esm*.rb"].each do |f|
      print "[Notice]: Remove #{f.gsub(scrinium_root, '<scrinium_root>')}.\n"
      FileUtils.remove f
    end
    # Copy migrate files.
    Dir["#{scrinium_esm_root}/db/migrate/*.rb"].each do |f|
      print "[Notice]: Copy #{f.gsub(scrinium_esm_root, '<scrinium_esm_root>')} to <scrinium_root>/db/migrate.\n"
      FileUtils.copy f, "#{scrinium_root}/db/migrate"
    end
    # Run migrate task.
    print "[Notice]: Run 'db:migrate' task.\n"
    system 'rake db:migrate'
    # Add CoffeeScript and SCSS assets.
    file_path = "#{scrinium_root}/app/assets/javascripts/engine_requires.coffee"
    FileUtils.touch file_path if not File.exist? file_path
    File.open(file_path) do |f|
      if not f.read.match('#= require scrinium_esm/application')
        print "[Notice]: Add CoffeeScript require line into <scrinium_root>/app/assets/javascripts/engine_requires.coffee.\n"
        f << "#= require scrinium_esm/application\n"
      end
    end
    file_path = "#{scrinium_root}/app/assets/stylesheets/engine_requires.scss"
    FileUtils.touch file_path if not File.exist? file_path
    File.open(file_path) do |f|
      if not f.read.match('//= require scrinium_esm/application')
        print "[Notice]: Add SCSS require line into <scrinium_root>/app/assets/stylesheets/engine_requires.scss.\n"
        f << "//= require scrinium_esm/application\n"
      end
    end
    # Add routes.
    file_path = "#{scrinium_root}/config/engine_routes.rb"
    FileUtils.touch file_path if not File.exist? file_path
    File.open(file_path) do |f|
      if not f.read.match("mount ScriniumEsm::Engine, at: '/esm'")
        print "[Notice]: Add routes mount line into <scrinium_root>/config/engine_routes.rb.\n"
        f << "mount ScriniumEsm::Engine, at: '/esm'\n"
      end
    end
  end
end
