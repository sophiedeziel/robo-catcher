module SingletonModel
  extend ActiveSupport::Concern

  module ClassMethods
    def instance
      last || create
    end
  end
end
