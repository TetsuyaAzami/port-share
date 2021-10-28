require 'rails_helper'

RSpec.describe Technique, type: :model do
  it 'Techniqueテーブルが不変であること' do
    expect(described_class.all.pluck(:technique)).to eq(
      %w[
        HTML
        CSS
        PHP
        Laravel
        WordPress
        Bootstrap
        Ruby
        Rails
        Javascript
        jQuery
        Python
        Flask
        Unity
        React
        Vue.js
      ]
    )
  end
end
