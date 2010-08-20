#!/usr/bin/env ruby

class Preprocessor
	def create_summaries
		summaries=[]
		Categories.get_types.each{|i|
			summaries<<create_summary_item(i[:name],i[:title]+" summary")
		}
		return summaries
	end
	private
	def create_summary_item(type,title)
		# Then create the summary page
		content = "<%= render 'summary_#{type}' %>\n"
		summary = Nanoc3::Item.new(content,
			{
				:title => "#{title}",
				:filename=>"content/#{type}/index.html",
				:extension=>'html'
			},
			"/#{type}/")
		return summary
	end
end
