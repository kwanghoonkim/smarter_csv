require 'spec_helper'

fixture_path = 'spec/fixtures'

describe 'malformed_csv' do
  subject { lambda { SmarterCSV.process(csv_path) } }

  context "malformed header" do
    let(:csv_path) { "#{fixture_path}/malformed_header.csv" }
    it { should raise_error(CSV::MalformedCSVError) }
    it { should raise_error(CSV::MalformedCSVError, "Any value after quoted field isn't allowed in line 1. [SmarterCSV: csv line 1]") }
  end

  context "malformed content" do
    let(:csv_path) { "#{fixture_path}/malformed.csv" }
    it { should raise_error(CSV::MalformedCSVError) }
    it { should raise_error(CSV::MalformedCSVError, "Any value after quoted field isn't allowed in line 1. [SmarterCSV: csv line 3]") }
  end
end
