module SignInModule
  def sign_in_as(user)
    visit root_path
    find('.navbar-toggler-icon').click
    find('.Log-in').click

    fill_in('名前', with: user.name.to_s)
    fill_in('メールアドレス', with: user.email.to_s)
    fill_in('パスワード', with: user.password.to_s)

    click_on('Log in')
  end
end
