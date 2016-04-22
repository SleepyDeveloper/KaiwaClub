module ReportsHelper
  #module Chart
    #extend self
    def multi_tooltip_template
      "<%= datasetLabel %>: <%= value %>"
    end
  #end
end
