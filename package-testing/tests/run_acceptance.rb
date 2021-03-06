test_name 'Run acceptance spec against package'
require 'pdk/pdk_helper.rb'

step 'Run the tests' do
  # TODO: Need to add junit formatter to allow junit XML output for CI to parse
  # TODO: json formatter causes rspec to crash when encoding results in json
  rspec_command = "#{command_prefix(workstation)} bundle exec rspec --pattern 'spec/acceptance/**.rb' --format documentation --out results.out"
  on(workstation, rspec_command, accept_all_exit_codes: true) do |outcome|
    assert_equal('', outcome.stderr, 'rspec stderr should be blank')
    assert_equal(0, outcome.exit_code, 'rspec acceptance tests should exit with 0')
  end
end
