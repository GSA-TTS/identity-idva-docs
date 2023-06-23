# Plugin to add environment variables to the `site` object in Liquid templates

module Jekyll
  class EnvVariables < Generator
    def generate(site)
      site.config['env'] = {}
      ENV.each_pair { |k, v| site.config['env'][k] = v }
    end
  end
end