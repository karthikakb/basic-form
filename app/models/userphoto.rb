class Userphoto < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader  
  belongs_to  :user, optional: true
end
