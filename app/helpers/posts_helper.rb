module PostsHelper
    def format_time(time_str)
        time_str.strftime("%Y年%m月%d日 %H:%M:%S")
    end
end
