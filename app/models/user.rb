class User < ApplicationRecord
  has_one :useraddress
  accepts_nested_attributes_for :useraddress
  has_one :userphoto
  accepts_nested_attributes_for :userphoto

  def useraddress
    super || build_useraddress
  end

  def userphoto
    super || build_userphoto
  end


end
