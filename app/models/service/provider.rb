# frozen_string_literal: true

class Service
  class Provider < ApplicationRecord
    validates :name, presence: true
  end
end
