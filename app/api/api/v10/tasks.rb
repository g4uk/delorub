class Api::V10::Tasks < ApplicationAPI
  namespace :tasks do
    namespace :files do
      desc 'Upload a new file'
      params do
        requires :file, type: File, desc: 'File'
      end
      post do
        present :phone, params[:phone]
      end
    end
  end
end