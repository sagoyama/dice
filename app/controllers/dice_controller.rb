class DiceController < ApplicationController
	def index
		@rolls = Roll.find(:all, :order => "created_at DESC,id DESC", :limit=>5)
	end
	def shake
		dice = Dice.new
		@result = dice.shake
		roll = Roll.new
		roll.value = @result
		roll.save
	end
	def gamble
		if request.post?
			dealer = Dealer.new
			dealer.shake
			@chouhan = dealer.chouhan
			@result = dealer.judge(params[:expected])
			@values = dealer.values
		end
	end
	def report
		@count=Roll.count
		@statistics=Roll.count(:group => :value)
	end
end
