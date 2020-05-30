require 'nanoc3/tasks'

def ftppush(server,user,pass,directory)
	IO.popen('lftp -c "set ftp:list-options -a;
		open ftp://'+user+':'+pass+'@'+server+';
		lcd ./output;
		cd '+directory+';
		mirror --reverse --delete --use-cache --verbose --no-perms --no-umask --parallel=1"'){ |f|
		until f.eof?
			puts f.gets
		end
	}
	print("Done.\n")
end

namespace :deploy do
	require 'highline/import'

	desc 'Deploy site to byet'
	task :ftp_byet do
		username = ask("Enter your username:  ") { |q| q.echo = true }
		password = ask("Enter your password:  ") { |q| q.echo = "*" }
		ftppush('ftp.byethost14.com',username,password,'/mao-yu.com/htdocs')
	end

	desc 'Deploy site to freehostia'
	task :ftp_freehostia do
		username = ask("Enter your username:  ") { |q| q.echo = true }
		password = ask("Enter your password:  ") { |q| q.echo = "*" }
		ftppush('maoserr.freehostia.com',username,password,'/maoserr.freehostia.com')
	end

end
