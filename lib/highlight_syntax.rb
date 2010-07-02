class HighlightSyntax < Nanoc3::Filter
  identifier :highlight_syntax

  def run(content, params={})
	newcontent = content

    # Colorize
	content.scan(%r'<pre><code class="language-([^"]+)">(.*?)</code></pre>'m){|lang,code|
		highlighted = pygmentize(code,lang,params)
		rep_txt = '<pre><code class="language-'+lang+'">'+code+'</code></pre>'
		newcontent=newcontent.gsub(rep_txt,highlighted)
	}
	newcontent
  end

private

  def pygmentize(code, language, params={})
    IO.popen("pygmentize -l #{language} -f html", "r+") do |io|
      io.write(code)
      io.close_write
      return io.read
    end
  end

end
