class Useraddress < ApplicationRecord
  belongs_to  :user, optional: true
end
