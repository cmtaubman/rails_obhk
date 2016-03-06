class HomeController < ApplicationController

  def homepage
    @bars = []
    all_bars = Bar.all
    all_bars.each_with_index do |bar, i|
      if i % 3 == 0
        @bars << [bar]
      else
        @bars[i/3] << bar
      end
    end
  end

end
