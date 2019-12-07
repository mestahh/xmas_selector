require_relative '../lib/member'

describe Member do 
	it "cant assign to itself" do
		member = Member.new('Mesti', [])
		expect(member.can_choose?(member)).to eq(false)
	end

	it "cant assign to someone who has me on his ignore list" do
		member = Member.new('Mesti', [])
		other_member = Member.new('Bali', ['Mesti'])
		expect(member.can_choose?(other_member)).to eq(false)
	end

	it "cant assign one that is in the ignore list" do
		member = Member.new('Mesti', ['Bali'])
		other_member = Member.new('Bali', [])
		expect(member.can_choose?(other_member)).to eq(false)
	end

	it "cant assign one that is in the ignore list if the list is empty" do
		member = Member.new('Mesti', [])
		other_member = Member.new('Bali', ['Panka'])
		expect(member.can_choose?(other_member)).to eq(true)
	end

	it "can assign one that is not in the ignore list" do
		member = Member.new('Mesti', ['Panka'])
		other_member = Member.new('Bali', [])
		expect(member.can_choose?(other_member)).to eq(true)
	end

	it "cant assign one that is already chosen" do
		member = Member.new('Mesti', ['Panka'])
		other_member = Member.new('Bali', [])
		other_member.can_be_assigned = false
		expect(member.can_choose?(other_member)).to eq(false)
	end

	it "can be assign one that is not already chosen" do
		member = Member.new('Mesti', ['Panka'])
		other_member = Member.new('Bali', [])
		expect(member.can_choose?(other_member)).to eq(true)
	end

	it "stores the chosen member" do
		member = Member.new('Mesti', ['Panka'])
		other_member = Member.new('Panka', ['Almos'])
		member.chosen = other_member
		expect(member.chosen).to eq(other_member)
	end
end