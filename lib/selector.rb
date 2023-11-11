require_relative './member'

class Selector 

	def initialize(members)
		@members = members
	end

	def select_member
		members_clone = @members.map(&:clone)

		begin 
			members_clone.each do |member|
				if member.chosen == nil
					#puts 'selecting for ' + member.name
					random_member = get_random(member, members_clone)
					#puts random_member.name + ' was selected for ' + member.name
					random_member.can_be_assigned = false
					member.chosen = random_member.name
				end
			end
		rescue
			puts 'Problem happened'
			@members.each { |m| m.chosen = nil; m.can_be_assigned = true }
			return select_member
		end
		members_clone
	end

	private 

	def get_random(member, members)
		remaining_members = members.select { |m| member.can_choose?(m) }
		if remaining_members == []
			raise 'Problem, restart'
		end
		remaining_members[rand(remaining_members.size)]
	end
end
