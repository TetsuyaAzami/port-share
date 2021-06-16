require 'rails_helper'

RSpec.describe Technique, type: :model do
    it "Techniqueテーブルが不変であること" do
      expect(Technique.pluck(:technique)).to eq(%W[
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
        ])
      end
end
