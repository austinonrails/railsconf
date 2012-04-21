module BohconfSessionsHelper
	def session_time(time)
		options = []

		if Time.zone.now < Time.zone.parse("2012-04-23 10:00pm")
			(9..11).each do |i|
				options << ["Monday #{i}:00am", Time.zone.parse("2012-04-23 #{i}:00am")]
				options << ["Monday #{i}:30am", Time.zone.parse("2012-04-23 #{i}:30am")]
			end
			options << ["Monday 12:00pm", Time.zone.parse("2012-04-23 12:00pm")]
			options << ["Monday 12:30pm", Time.zone.parse("2012-04-23 12:30pm")]
			(1..10).each do |i|
				options << ["Monday #{i}:00pm", Time.zone.parse("2012-04-23 #{i+12}:00pm")]
				options << ["Monday #{i}:30pm", Time.zone.parse("2012-04-23 #{i+12}:30pm")]
			end
		end

		if Time.zone.now < Time.zone.parse("2012-04-24 9:00pm")
			(9..11).each do |i|
				options << ["Tuesday #{i}:00am", Time.zone.parse("2012-04-24 #{i}:00am")]
				options << ["Tuesday #{i}:30am", Time.zone.parse("2012-04-24 #{i}:30am")]
			end
			options << ["Tuesday 12:00pm", Time.zone.parse("2012-04-24 12:00pm")]
			options << ["Tuesday 12:30pm", Time.zone.parse("2012-04-24 12:30pm")]
			(1..9).each do |i|
				options << ["Tuesday #{i}:00pm", Time.zone.parse("2012-04-24 #{i+12}:00pm")]
				options << ["Tuesday #{i}:30pm", Time.zone.parse("2012-04-24 #{i+12}:30pm")]
			end
		end

		(9..11).each do |i|
			options << ["Wednesday #{i}:00am", Time.zone.parse("2012-04-25 #{i}:00am")]
			options << ["Wednesday #{i}:30am", Time.zone.parse("2012-04-25 #{i}:30am")]
		end
		options << ["Wednesday 12:00pm", Time.zone.parse("2012-04-25 12:00pm")]
		options << ["Wednesday 12:30pm", Time.zone.parse("2012-04-25 12:30pm")]
		(1..3).each do |i|
			options << ["Wednesday #{i}:00pm", Time.zone.parse("2012-04-25 #{i+12}:00pm")]
			options << ["Wednesday #{i}:30pm", Time.zone.parse("2012-04-25 #{i+12}:30pm")]
		end

		options_for_select(options)
	end
end
