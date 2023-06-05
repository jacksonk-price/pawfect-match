class Survey < ApplicationRecord
  validates_presence_of :name_input
  validates :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input,
            :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input,
            :trainability_input, :energy_input, :barking_input, :mental_stim_input,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end