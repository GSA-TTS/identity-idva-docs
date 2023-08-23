# Plugin to add environment variables to the `site` object in Liquid templates

module Jekyll
  class EnvVariables < Generator
    def generate(site)
      site.config['env'] = {}
      site.config['gtag'] = {}
      ENV.each_pair { |k, v| site.config['env'][k] = v }
      puts "--------------------------------------------------------------------"
      puts "---------------------- READING ENV VARIABLES -----------------------"
      puts "--------------------------------------------------------------------"
      

      if ENV["BRANCH"] == "main"            
        site.config['gtag'] = ENV["GA_ACCESS_KEY"]
        puts "------------ !!! WARNING This is a PRODUCTION build !!! ------------"
      else
        site.config['gtag'] = ENV["DEMO_GA_ACCESS_KEY"]
        puts "---------------------------- Test BUILD: #{ENV["BRANCH"]} ----------------------------"
      end
    end
  end
end