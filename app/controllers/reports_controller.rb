class ReportsController < ApplicationController
  def index
    @meetups = Meetup.all.order(date: :asc)

    @data  = {
    labels: @meetups.map{ | m | m.date.strftime("%Y/%m/%d")},
    datasets: [
        {
            label: "Japanese",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: @meetups.map{ | m | m.japanese_attendees.count }
        },
        {
            label: "English",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: @meetups.map{ | m |m.english_attendees.count }
        }
    ]
}
  end
end
