# frozen_string_literal: true

require "rails_helper"

RSpec.describe Gender do
  subject(:instance) { described_class.new(gender:) }

  let(:gender) { :male }

  describe '.all' do
    subject(:result) { described_class.all }

    let(:values) { %i[foo bar] }

    before do
      stub_const("#{described_class.name}::VALUES", values)
    end

    it 'is expected to return 2 instances' do
      expect(result.size).to eq 2
    end
  end

  describe '#name' do
    subject(:result) { instance.name }

    it { is_expected.to eq "male" }
  end
end
