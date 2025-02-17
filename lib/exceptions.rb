# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

module Exceptions

  class NotAuthorized < StandardError; end

  class Forbidden < StandardError; end

  class UnprocessableEntity < StandardError; end

  class ApplicationModel < UnprocessableEntity
    attr_reader :record

    def initialize(record, message)
      super(message)
      @record = record
    end
  end

  def self.policy_class
    ExceptionsPolicy
  end

end
