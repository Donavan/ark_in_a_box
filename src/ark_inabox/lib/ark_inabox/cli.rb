require 'fileutils'

module ArkInabox
  class CLI
    ARK_ROOT_KEY ='ARK_INABOX_ROOT'
    DEFAULT_ROOT = '~/.ark_inabox'
    @@root_folder = nil

    def self.root_folder
      return @@root_folder unless @@root_folder.nil?
      ENV[ARK_ROOT_KEY].nil? ? DEFAULT_ROOT : ENV[ARK_ROOT_KEY]
    end

    def self.root_folder=(folder_name)
      @@root_folder = folder_name
    end


    def init
      FileUtils.mkpath CLI::root_folder
      FileUtils.cp_r "#{internal_support_path}/new_ark_files", "#{CLI::root_folder}/new_ark_files"
    end

    private
    def internal_support_path
      File.expand_path('../../support', __FILE__)
    end
  end
end