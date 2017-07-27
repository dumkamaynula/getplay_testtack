class ProductionTracking < ApplicationRecord
	belongs_to :designer, class_name: "Employee", optional: true
	belongs_to :writer, class_name: "Employee", optional: true
	belongs_to :composer, class_name: "Employee", optional: true
	belongs_to :illustrator, class_name: "Employee", optional: true
	belongs_to :developer, class_name: "Employee", optional: true
	belongs_to :game, optional: true

	after_update :change_employee_records, :remove_employees_from_track


	private

	def change_employee_records
		self.designer.update_column(:game_id, self.game_id) if self.designer
		self.illustrator.update_column(:game_id, self.game_id) if self.illustrator
		self.writer.update_column(:game_id, self.game_id) if self.writer
		self.composer.update_column(:game_id, self.game_id) if self.composer
		self.developer.update_column(:game_id, self.game_id) if self.developer
	end
	def remove_employees_from_track
		
		@design_trackings = ProductionTracking.where(designer_id: self.designer_id)
		@design_trackings.each {|t| t.update_column(:designer_id, nil) unless t == self}

		@illustration_trackings = ProductionTracking.where(illustrator_id: self.illustrator_id)
		@illustration_trackings.each {|t| t.update_column(:illustrator_id, nil) unless t == self}

		@write_trackings = ProductionTracking.where(writer_id: self.writer_id)
		@write_trackings.each {|t| t.update_column(:writer_id, nil) unless t == self}

		@compose_trackings = ProductionTracking.where(composer_id: self.composer_id)
		@compose_trackings.each {|t| t.update_column(:composer_id, nil) unless t == self}

		@developing_trackings = ProductionTracking.where(developer_id: self.developer_id)
		@developing_trackings.each {|t| t.update_column(:developer_id, nil) unless t == self}

	end


end
