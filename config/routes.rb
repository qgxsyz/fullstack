Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # 学习中心
  # namespace :dashboard do
  #   # get :get_dashboard
  #   resources :courses
  # end

  resources :dashboard, only: [:index]

  #文章
  resources :posts, only: [:show]

  # meetup
  resources :meetup_groups

  # 编程比赛
  resources :competitions

  # 直播室
  namespace :live do
    get :get_live
  end

  # 帮助文档
  namespace :docs do
    get :get_docs
  end

  # 交流论坛
  namespace :forum do
    get :get_forum
  end


  # 某个课程
  resources :courses do
    get 'syllabus', to: 'courses#get_syllabus'

    namespace :assignments do
      get :get_assignments
    end
    namespace :faqs do
      get :get_faqs
    end
    namespace :activities do
      get :get_activities
    end
    namespace :leaderboard do
      get :get_leaderboard
    end
  end

  # 节主体内容
  resources :posts

  # 作业
  resources :tasks do
    # 答案
    resources :other_answers
  end


  namespace :admin do
    root to: "dashboard#index"
    get 'dashboard', to: 'dashboard#index'

    resources :courses do
      member do
        post :lock
        post :unlock
      end

      resources :chapters
    end

    # 节 crud
    resources :chapters do
      resources :sections
    end

    # 作业 rd
    resources :assignments, only: [:index, :show, :destroy]
    # 作业 cu
    resources :sections do
      resources :assignments
    end
  end

  # 路径错误 提示页面
  match '*path', to: 'application#routing_error', via: :all

end
