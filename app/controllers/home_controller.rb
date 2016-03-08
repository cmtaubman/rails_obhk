class HomeController < ApplicationController

  def homepage
    if params.empty?
      @bars = []
      all_bars = Bar.all
      all_bars.each_with_index do |bar, i|
        if i % 3 == 0
          @bars << [bar]
        else
          @bars[i/3] << bar
        end
      end
    else
      all_bars = Bar.where(day: day, time: time, location: location, price: price, drink: drink, features: features)
    end
  end

end
