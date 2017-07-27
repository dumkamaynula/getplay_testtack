class Game < ApplicationRecord
	include Paperclip::Glue
	
	has_attached_file :photo, :styles => { 	:medium => "300x300>", 
											:large => "500x500>"},
	 :convert_options => {:thumb => "-gravity center -extent 100x100"},
	 :default_url => "/images/:style/missing.png",
	 :source_file_options =>  {:all => '-auto-orient'}#,
  	
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  	validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 5.megabytes

    has_one :production_tracking, dependent: :destroy
	has_many :employees

	STORES = ['App Store', 'Google Play', 'Windows Store']

	after_create :create_tracking

	private

		def create_tracking
			@production_tracking = ProductionTracking.create(game_id: self.id)
		end
end
