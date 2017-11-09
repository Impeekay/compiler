class FileDeleteJob < ApplicationJob
    queue_as :default

    def perform(file)
      @flag = File.exist? ("temporary/#{file}")
      if @flag
        FileUtils.rm_rf("temporary/#{file}")
      end
    end
end
