# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Sequence
    module Import
      module Kayako
        class CaseField < Sequencer::Sequence::Base

          def self.sequence
            [
              'Common::ModelClass::Ticket',
              'Import::Kayako::ObjectAttribute::Skip',
              'Import::Kayako::ObjectAttribute::SanitizedName',
              'Import::Kayako::ObjectAttribute::Config',
              'Import::Kayako::ObjectAttribute::Add',
              'Import::Kayako::ObjectAttribute::MigrationExecute',
              'Import::Kayako::ObjectAttribute::FieldMap',
            ]
          end
        end
      end
    end
  end
end
