# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :order

  validates :name, presence: true
end
