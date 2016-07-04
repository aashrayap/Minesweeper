class Cell
	def initialize(row,column,cellmarker,hidden=true)
		@row=row
		@column=column
		@cellmarker=cellmarker
		@hidden=hidden
	end
	attr_accessor :cellmarker, :hidden
end

#hidden= true,false
#cellmarker = bomb,blank,numbombs