require "net/http"
params = Hash.new
params[:id] = ARGV[0]
params[:pd] = ARGV[1]
addr = "http://10.42.0.35"
uri = URI.parse(addr + "/reg")
res = Net::HTTP.post_form(uri, params)

def gen(last)
	if last > 4
		last - rand( Math.exp( last / 10 ) )
	else
		last + rand( Math.exp( last / 10 ) )
	end
end
last = 17
while true
	params[:num] = gen(last)
	uri = URI.parse(addr + "/attend")
	res = Net::HTTP.post_form(uri, params)
	str = res.body.split(/,/)
	
	time = str[0].to_f
	turn = str[1].to_i
	succ = str[2].to_i

	puts time
	sleep(time)

	uri = URI.parse(addr + "/result")
	res = Net::HTTP.get(uri) 
	str = res.split(/\n/)
	last = str[0].to_f
	puts last

end
