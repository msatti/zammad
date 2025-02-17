# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Unit
    module Import
      module Kayako
        class Request < Sequencer::Unit::Common::Provider::Attribute
          extend ::Sequencer::Unit::Import::Kayako::Requester

          uses :object, :request_params
          provides :response

          private

          def response

            builder = backend.new(
              object:         object,
              request_params: request_params
            )

            self.class.request(
              api_path: builder.api_path,
              params:   builder.params,
            )
          end

          def backend
            request_class = "::Sequencer::Unit::Import::Kayako::Request::#{object}".safe_constantize

            return request_class if request_class.present?
            return ::Sequencer::Unit::Import::Kayako::Request::GenericField if object.include?('Field')

            ::Sequencer::Unit::Import::Kayako::Request::Generic
          end
        end
      end
    end
  end
end
