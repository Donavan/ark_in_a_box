require 'spec_helper'
require 'fileutils'

describe ArkInabox::CLI do
  clazz = ArkInabox::CLI

  before(:each) do
    @cli = clazz.new
  end


  it 'exposes an init command' do
    expect(@cli).to respond_to(:init)
  end

  describe 'root folder logic' do
    it 'exposes a class level root_folder getter' do
      expect(clazz).to respond_to(:root_folder)
    end

    it 'exposes a class level root_folder setter' do
      expect(clazz).to respond_to(:root_folder=)
    end


    it 'returns the default folder if the root folder has not been set and no env variable exists' do
      expect(clazz.root_folder).to eq(ArkInabox::CLI::DEFAULT_ROOT)
    end

    it 'returns folder from the env if the root folder has not been set' do
      some_value = 'value from env'
      ENV[ArkInabox::CLI::ARK_ROOT_KEY] = some_value

      expect(clazz.root_folder).to eq(some_value)
    end

    it 'returns folder it was set to if the root folder has been set' do
      some_value = 'value I set'
      clazz.root_folder= some_value

      expect(clazz.root_folder).to eq(some_value)
    end

  end

  describe 'project init' do
    it 'creates the support folder' do
      my_folder = './tmp/test_init'
      clazz.root_folder= my_folder

      @cli.init

      expect(File.exist?(my_folder)).to eq true
      FileUtils.rm_rf(my_folder)
    end

    it 'creates the new_ark_files folder' do
      my_folder = './tmp/test_init'
      clazz.root_folder= my_folder

      @cli.init

      expect(File.exist?("#{my_folder}/new_ark_files")).to eq true
      FileUtils.rm_rf(my_folder)
    end

  end

  describe 'configuration' do
    it 'exposes a config object' do
      expect(@cli).to respond_to :config
    end
  end
end
