module AstralFrontier
  class App < Nesta::App
    def current_breadcrumb_class
      'current'
    end
  end
end

Tilt.prefer Tilt::KramdownTemplate
