require "net/http"
params = Hash.new
params[:id] = "test2"
params[:pd] = "test2"
uri = URI.parse("http://192.168.102.239/reg")
res = Net::HTTP.post_form(uri, params)
puts res.body

while true
	params[:turn] = 0
	params[:num] = rand(100)
	uri = URI.parse("http://192.168.102.239/attend")
	res = Net::HTTP.post_form(uri, params)
	puts res.body
	rt = res.body.to_f
	sleep(rt)
end
