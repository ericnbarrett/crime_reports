class Relationship < ActiveRecord::Base
  attr_accessible :description, :name, :relationship_translations_attributes
  translates :description, :name

  has_many :relationship_translations, :dependent => :destroy

  accepts_nested_attributes_for :relationship_translations

  def self.by_name(name)
    with_translations(I18n.locale).find_by_name(name)
  end
end
