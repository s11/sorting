class Article < ActiveRecord::Base
#  Acts as list used for positioning the article element
  acts_as_list #:scope => :position_id
  #default_scope => position
  has_and_belongs_to_many :categories
end
