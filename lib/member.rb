class Member

	attr_accessor :name, :ignores, :can_be_assigned, :chosen, :email

	def initialize(name, ignores = [], email = '')
		@name = name
		@ignores = ignores
		@can_be_assigned = true
		@email = email
	end

	def can_choose?(member)
		member.name != @name && 
		!@ignores.include?(member.name) && 
		member.can_be_assigned && 
		!member.ignores.include?(@name)
	end

	def to_s
		@name + " " + @ignores.to_s + " " + @can_be_assigned.to_s + " -> " + @chosen 
	end
end