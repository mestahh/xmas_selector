require 'rspec'
require_relative '../lib/selector'
require_relative '../lib/member'

describe "Selector" do

	members = [
		Member.new('Sandor mama', [], ''),
		Member.new('Vica mama', [], ''),
		Member.new('Andris', ['Zita'], ''),
		Member.new('Zita', ['Andris'], ''),
		Member.new('Bali', ['Panka'], ''),
		Member.new('Panka', ['Bali'], ''),
		Member.new('Norbi', ['Zsofi'], ''),
		Member.new('Zsofi', ['Norbi'], ''),
		Member.new('Teri neni', ['Pista bacsi', 'Andi'], ''),
		Member.new('Pista bacsi', ['Teri neni', 'Andi'], ''),
		Member.new('Meli', ['Hapi'], ''),
		Member.new('Hapi', ['Meli'], ''),
		Member.new('Tomi', ['Andi'], ''),
		Member.new('Andi', ['Tomi'], '')
	]

	it "does protect against circular dependency" do
		mwcd = [
			Member.new('Andi', ['Tomi']),
			Member.new('Tomi', ['Andi']),
			Member.new('Andris', ['Zita']),
			Member.new('Zita', ['Andris'])
		]	
		mwcd[0].chosen = 'Zita'
		mwcd[0].can_be_assigned = false
		mwcd[1].chosen = 'Andris'
		mwcd[1].can_be_assigned = false


		after_selection = Selector.new(mwcd).select_member
		after_selection.each do |m|
			expect(m.chosen).to be_truthy
			expect(m.can_be_assigned).to eq(false)
		end
	end

	it "works with the real family data" do
		after_selection = Selector.new(members).select_member
		after_selection.each do |m|
			expect(m.chosen).to be_truthy
			expect(m.can_be_assigned).to eq(false)
			expect(m.ignores.include?(m.chosen)).not_to eq(true)
		end
	end
end
