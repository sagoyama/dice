class Dealer
		attr_reader :values

		def initialize
		  @dice = [Dice.new]*2
		end

		def shake
			@values = @dice.map{|dice| dice.shake}
		end

		def chouhan
			if self.even?
				"丁"
			else
				"半"
			end
		end

		def sum
			sum=@values[0]+@values[1]
		end
		def even?
			self.sum.even?
		end

		def odd?
			self.sum.odd?
		end

		def judge(expected)
			self.shake
			if((expected == "丁" && self.even?)or
				 (expected == "半" && self.odd?))
				 :win
			else
				:loose
			end
	end
end
