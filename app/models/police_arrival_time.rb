class PoliceArrivalTime < ActiveRecord::Base
  attr_accessible :name, :police_arrival_time_translations_attributes

  translates :name

  has_many :police_arrival_time_translations, :dependent => :destroy
  accepts_nested_attributes_for :police_arrival_time_translations

  has_one :report

  def self.by_name(name)
    with_translations(I18n.locale).find_by_name(name)
  end
end