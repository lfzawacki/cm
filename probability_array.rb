# very ugly class that I was using to retrieve elements from
# a set with probabilities

# usage can be seen in the prob_example.rb file

class ProbabilityArray
	attr_reader :last_prob

	def initialize list
		@current_prob = 0
		@objects = []

		list = list.to_a
		list.each do |elem|
			append(*elem)
		end
	end 

	def append obj,prob
		if @current_prob + prob <= 1
			start, finish = @current_prob , @current_prob + prob
			@objects << [obj,start..finish]		
			@current_prob = finish
		else
			throw "Your probabilities are off man!"
		end		
	end

	def get
		i = 0
		found = nil
		prob = rand()
		@last_prob = prob		
		while i < @objects.size and not found
			found = i if @objects[i][1].include?(prob)
			i += 1
		end

		found ? @objects[found][0] : nil
	end

end

