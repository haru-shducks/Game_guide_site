Rails.application.routes.draw do



  # -----# 管理者ルーティング VV VV

  # ログイン機能
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do


  # ルートパス
    root 'homes#top'


  end


  # -----# 管理者ルーティング AA AA


  # -----# ユーザールーティング VV VV


  # ログイン機能　登録機能
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }


  # 隠しpublic
  scope module: :public do


  # トップ
    root 'homes#top'
    get 'homes/about'


  # -----グループ VV VV


  # グループ
    resources :groups, only: [:show,:new,:create,:edit,:update,:destroy]


  # グループ登録
    resources :group_users, only: [:create,:destroy]


  # グループチャット機能
    resources :group_chats, only: [:create,:destroy]


  # -----グループ AA AA


  # 投稿ページ
    resources :posts


  end


  # -----# ユーザールーティング AA AA


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
