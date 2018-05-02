module ApplicationHelper
    def show_time(time)
        time.strftime("%H:%M-%Y年%m月%d日")
    end
end
