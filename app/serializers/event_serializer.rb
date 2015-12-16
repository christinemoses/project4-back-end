class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date
end
