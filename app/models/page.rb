class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	acts_as_list :scope => :subject

	before_validation :add_default_permalink
	

	after_save :touch_subject

	validates_presence_of :name
	validates_presence_of :permalink
	validates_length_of :name, :maximum => 255
	validates_length_of :permalink, :within => 3..255
	validates_uniqueness_of :permalink

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("pages.position ASC")}
	scope :newest_first, lambda { order("pages.created_at DESC LIMIT 1")}
	scope :search, lambda { |query|
		where(["name LIKE ?", "%#{query}%"]) 
	}

	private

	def add_default_permalink
		if permalink.blank?
			self.permalink = "#{id}-#{name.parameterize}"
		end
	end

	def touch_subject
		subject.touch
	end
end
