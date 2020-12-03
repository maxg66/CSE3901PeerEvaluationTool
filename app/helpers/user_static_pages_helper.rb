module UserStaticPagesHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            puts session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def save_team_member(team_member)
        session[:team_member_id] = team_member.id
    end

    def team_member
        if session[:team_member_id]
            puts session[:team_member_id]
            @team_member ||= User.find_by(id: session[:team_member_id])
        end
    end
end
