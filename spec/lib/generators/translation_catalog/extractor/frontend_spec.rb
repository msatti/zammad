# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

require 'rails_helper'

RSpec.describe Generators::TranslationCatalog::Extractor::Frontend do
  subject(:extractor_module) { described_class.new }

  let(:filename) { 'myfile' }
  let(:result_strings) do
    extractor_module.extract_from_string(string, filename)
    extractor_module.strings
  end

  context 'with strings to be found' do
    let(:string) do
      <<~'CODE'
        __('__ String')
        App.i18n.translateContent('String')
        App.i18n.translateInline('Inline string')
        App.i18n.translatePlain("Double quoted String with '")
        @T('T')
        @Ti('Ti')
      CODE
    end

    it 'finds the correct strings' do
      expect(result_strings).to eq(Set['__ String', 'String', 'Inline string', "Double quoted String with '", 'T', 'Ti'])
    end
  end

  context 'with strings to be ignored' do
    let(:string) do
      <<~'CODE'
        App.i18n.translateContent(dynamic_variable)
        App.i18n.translateContent("String with #{interpolation}")
        @Tdate(ignore)
        @Ti('')
      CODE
    end

    it 'does not find strings' do
      expect(result_strings).to eq(Set[])
    end
  end

  context 'with strings too long' do
    let(:string) do
      <<~"CODE"
        __("#{'a' * 3001}")
      CODE
    end

    it 'raises an error' do
      expect { result_strings }.to raise_error(%r{Found a string that longer than than the allowed 3000 characters})
    end
  end
end
