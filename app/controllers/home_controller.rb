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


  # Filter bar: I need the home controller to show the filtered results and render the appropriate bars
  # def js_redirect_to(path)
  #     render js: %(window.location.href='#{/?}') and return
  # end
end
