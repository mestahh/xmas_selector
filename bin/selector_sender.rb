
require_relative '../lib/selector'



members = [
  Member.new('Sándor mama', [''], 'j@j.com'),
  Member.new('Vica', ['Jozsó'], 'j@j.com'),
  Member.new('Jozsó', ['Vica'], 'j@j.com'),
  Member.new('Zsófi', ['Norbi'], 'j@j.com'),
  Member.new('Norbi', ['Zsófi'], 'j@j.com'),
  Member.new('Panka', ['Bali'], 'j@j.com'),
  Member.new('Bali', ['Panka'], 'j@j.com'),
  Member.new('Tamás', ['Andi'], 'j@j.com'),
  Member.new('Andi', ['Tamás'], 'j@j.com'),
  Member.new('Andris', ['Zita'], 'j@j.com'),
  Member.new('Zita', ['Andris'], 'j@j.com'),
  Member.new('Hápi', ['Meli'], 'j@j.com'),
  Member.new('Meli', ['Hápi'], 'j@j.com'),
  Member.new('Pista bácsi', ['Teri néni'], 'j@j.com'),
  Member.new('Teri néni', ['Pista bácsi'], 'j@j.com'),
]

after_selection = Selector.new(members).select_member

after_selection.each do |m|
  puts "#{m.name} #{m.chosen}-t húzta"
end


