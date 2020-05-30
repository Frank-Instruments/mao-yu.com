#!/usr/bin/env ruby

module Categories
	def Categories.select_items_by_type(items,type)
		reg = Regexp.new('/'+type+'/[^/]+/$')
		# First parse the list of subitems
		subitems = []
		items.select{ |i| i.identifier =~ reg }.each do |j|
			subitems << j
		end
		return subitems
	end
	def Categories.select_text_items(items)
		pages = items.select{|i| 
			i[:extension]=='html' or i[:extension]=='mkd'
		}
		return pages
	end
	def Categories.get_level(item)
		return Categories.get_level_by_id(item.identifier)
	end
	def Categories.get_level_by_id(id)
		level=id.count('/')
		return level-1
	end
	def Categories.get_type(item)
		return Categories.get_type_by_id(item.identifier)
	end
	def Categories.get_type_by_id(id)
		name=id.match(%r|/([^/]+)/.*|)
		if name
			return name[1]
		else
			return ''
		end
	end
	def Categories.get_types
		return [
			{:name=>'projects',	:title=>'Projects'},
			{:name=>'resources',:title=>'Resources'},
			{:name=>'notes',	:title=>'Notes'}]
	end
	def Categories.sort_by_date(items)
		return items.sort_by{|i| i.mtime}.reverse
	end
	def Categories.format_time(time)
		return time.strftime("%b %d, %Y")
	end
end
