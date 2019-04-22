class ItemSerializer < ActiveModel::Serializer
  #attributes :id, :item_name, :description
  attributes :item_name, :item_description
  #def initialize(item, scope)
   # @item, @scope = item, scope
  #end

  #def serializable_hash
   # { item_name: @item.name, item_description: @item.description }
  #end

  #def as_json
   # { item: serializable_hash }
  #end
  def item_name
    object.name.upcase
  end
  def item_description
    object.description.upcase
  end 
end
