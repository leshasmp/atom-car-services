# frozen_string_literal: true

class Service
  class Category < ApplicationRecord
    validates :name, presence: true
  end
end
