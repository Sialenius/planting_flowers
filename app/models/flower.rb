# == Schema Information
#
# Table name: flowers
#
#  id            :integer          not null, primary key
#  f_name        :string(20)
#  culture_id    :integer
#  cost          :integer
#  garden_bed_id :integer
#  planting_date :date
#

class Flower < ActiveRecord::Base
  belongs_to :culture
  belongs_to :garden_bed
end
