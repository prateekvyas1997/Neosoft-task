require 'ostruct'

tree = {
	id: 1,
	tag: 'lobby',
	data: { title: 'Main Lobby' },
	children: [
		{
			id: 2,
			tag: 'request_action',
			data: { title: 'Fix it' },
			children: [
				{
					id: 3,
					tag: '',
					data: { title: 'Light' },
					children: [
						{
							id: 5,
							tag: '',
							data: { title: 'Nested Title' },
							children: [],
						}
					],
				},
				{
					id: 4,
					tag: '',
					data: { title: 'Fan' },
					children: [],
				}
			]
		}
	]
}

def find_by_id(tree, id)
    if tree[:id] == id
    	tree 
    elsif tree[:children].respond_to?(:each)
    	result = nil
    	tree[:children].find do |stree|
        	result = find_by_id(stree, id)
    	end
    	result
    end
end

node =  OpenStruct.new(find_by_id(tree, 5))
p node.data
