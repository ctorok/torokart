# == Schema Information
#
# Table name: arts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  picfile    :string(255)
#  type_art   :string(255)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#

class Art < ActiveRecord::Base
  attr_accessible  :name, :picfile, :type_art, :year
  belongs_to :art :inverse_of => :arts

end
