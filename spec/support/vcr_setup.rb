require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.default_cassette_options = {record: :new_episodes}
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<EMAIL>') { URI.encode_www_form_component ENV['EMAIL'] }
  c.filter_sensitive_data('<PASSWORD>') { URI.encode_www_form_component ENV['PASSWORD'] }
end
