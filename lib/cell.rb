class Cell
	def initialize(row,column,marker,hidden=true)
		@row=row
		@column=column
		@cellmarker=cellmarker
		@hidden=hidden
	end
	attr_accessor :cellmarker, :hidden
end
