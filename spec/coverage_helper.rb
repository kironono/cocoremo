require "simplecov"

if ENV['COVERAGE_DIR']
  SimpleCov.coverage_dir(ENV['COVERAGE_DIR'])
else
  SimpleCov.coverage_dir(File.join("spec", "coverage"))
end

SimpleCov.start 'rails' do
end
