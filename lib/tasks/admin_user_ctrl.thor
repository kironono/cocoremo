# vim: set ft=ruby :

class AdminUserCtrl < Thor

  desc 'create', 'create admin user'
  option :email, required: true
  option :password, required: true
  def create
    admin = Admin.new(
      email: options[:email],
      password: options[:password],
    )
    if admin.valid?
      admin.save!
      puts "#{admin.email} created."
    else
      puts admin.errors.full_messages.join("\n")
    end
  end

end
