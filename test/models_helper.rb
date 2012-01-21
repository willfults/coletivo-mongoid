require 'coletivo'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Coletivo::Models::Person
  include Coletivo::Models::Recommendable
  has_own_preferences

  field :name, type: String
  field :email, type: String
end

class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  include Coletivo::Models::Person
  include Coletivo::Models::Recommendable

  field :name, type: String
end

class Actor
  include Mongoid::Document
  include Mongoid::Timestamps
  include Coletivo::Models::Person
  include Coletivo::Models::Recommendable

  field :name, type: String
end


def ratings_container
  Coletivo::Config.ratings_container
end

class Test::Unit::TestCase
  def setup
    Mongoid.database.collections.each do |coll|
      coll.remove if coll.name !~ /system/
    end
  end
end
