class Profile::Operation < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Profile, :new)
    step Contract::Build(builder: :default_contract!)
    step :prepopulate!

    def default_contract! options, model:, **_
      if options['current_user']
        Profile::Contract::UserForm.new(model, current_user: options['current_user'])
      else
        Profile::Contract::GuestForm.new(model, current_user: options['current_user'])
      end
    end

    def prepopulate! options, params:, **_
      options['contract.default'].prepopulate!
    end
  end

  step Nested(Present)
  step Policy::Pundit(ProfilePolicy, :create?)
  step Contract::Validate()
  step :register_new_user!
  step Contract::Persist()
  success :send_create_profile_email!

  def register_new_user! options, params:, model:, **_
    unless options['current_user'].nil?
      model.user = options['current_user']
      return true
    end
    result = User::Operation::Registration.call(params['new_user'].to_hash)
    return false if result.failure?
    model.user = result['model']
    options['sign_in_new_user'] = result['model']
  end

  def send_create_profile_email! options, params:, model:, **_
    return true if options['current_user'].nil?
    UserMailer.create_profile(user: model.user).deliver_later
  end
end
