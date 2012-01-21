require 'mongoid'

module Coletivo
  module Models
    class PersonRating
      include Mongoid::Document
      include Mongoid::Timestamps

      field :person_id, type: String
      field :person_type, type: String
      
      field :rateable_id, type: String
      field :rateable_type, type: String

      field :weight, type: BigDecimal, :precision => 5, :scale => 2

      belongs_to :person, :polymorphic => true
      belongs_to :rateable, :polymorphic => true

      validates :person, :rateable, :weight, :presence => true

      def self.find_for_recommendation(person, rateable_type)
        where(:rateable_type => rateable_type.to_s)
      end
    end
  end
end
