require 'mongoid'

Mongoid::Document.send :include, Coletivo::Models::Person
Mongoid::Document.send :include, Coletivo::Models::Recommendable