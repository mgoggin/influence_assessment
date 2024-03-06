# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AgeGroup do
  subject(:instance) { described_class.new(range:) }

  let(:range) { 1..10 }

  it { is_expected.to have_attributes(range:) }
  it { is_expected.to delegate_method(:include?).to(:range) }

  describe '.all' do
    subject(:result) { described_class.all }

    let(:values) { [1..4, 5..9] }

    before do
      stub_const("#{described_class.name}::VALUES", values)
    end

    it 'is expected to return 2 instances' do
      expect(result.size).to eq 2
    end
  end

  describe '.for' do
    subject(:result) { described_class.for(age) }

    let(:age) { 4 }
    let(:values) { [1..4, 5..9] }

    before do
      stub_const("#{described_class.name}::VALUES", values)
    end

    it { is_expected.to be_a(described_class) }

    context 'when the specified age does not match a group' do
      let(:age) { 21 }

      it { is_expected.to be_nil }
    end
  end

  describe '#name' do
    subject(:result) { instance.name }

    it { is_expected.to eq "1-10" }

    context 'when the range is beginless' do
      let(:range) { ..10 }

      it { is_expected.to eq "Under 10" }
    end

    context 'when the range is endless' do
      let(:range) { 65.. }

      it { is_expected.to eq "65+" }
    end
  end
end
