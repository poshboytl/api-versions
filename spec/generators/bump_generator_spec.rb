require 'spec_helper'
require 'generators/api_versions/bump_generator'

describe ApiVersions::Generators::BumpGenerator do

  before do
    destination File.expand_path("../../../tmp", __FILE__)
    prepare_destination
  end

  describe "Generated files" do
    before { run_generator }

    describe "Bar Controller" do
      subject { file('app/controllers/api/v4/bar_controller.rb') }

      it { should exist }
      it { should contain /Api::V4::BarController < Api::V3::BarController/ }
    end

    describe "Foo Controller" do
      subject { file('app/controllers/api/v4/foo_controller.rb') }

      it { should exist }
      it { should contain /Api::V4::FooController < Api::V3::FooController/ }
    end

    describe "Users Controller" do
      subject { file('app/controllers/api/v4/users_controller.rb') }

      it { should_not exist }
    end
  end
end
