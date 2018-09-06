class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
    self.readers.map {|reader| reader.name }.join(", ")
  end

  def visible_to=(name_list)
    name_list.split(", ").each do |name|
      reader = User.find_by(:name => name)
      if reader
        self.readers << reader
      end
    end
    self.readers
  end

  def ensure_owner_can_read
    if user && !self.reader.include?(user)
      readers << user
    end
  end 

end
