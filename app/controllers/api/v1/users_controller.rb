class Api::V1::UsersController < Api::V1::ApiController

  def index
    allUsers = User.all
    render :json => {
      users: usersJSON(allUsers)
    }, status: 200
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  def sync_contacts
    if(params[:user] && params[:user][:identifier])
      user = User.find_by_identifer(params[:user][:identifier])
      user.first_name = params[:user][:first_name]
      user.last_name = params[:user][:last_name]
    else
      user = User.create(first_name: params[:user][:first_name], last_name: params[:last_name])
    end

    if !user
      render :json => {
        message: "Unknown user identifier."
      }, status: 402
    end
    contacts = params[:contacts]
    binding.pry
    contacts.each do |aContact|
      phones = aContact[:phones]
      emails = aContact[:emails]

      aContact.delete :phones
      aContact.delete :emails

      newContact = Contact.new(contact_params(aContact))
      if phones
        phones.each do |aPhone|
          newContact.phones.build(:number => aPhone)
        end
      end
      if emails
        emails.each do |anEmail|
          newContact.emails.build(:email => anEmail)
        end
      end
      newContact.save
      user.contacts << newContact
    end
    user.save

    render :json => {
      message: "#{user.contacts.count} contacts saved on server.",
      user: user,
      last_sync: DateTime.now
    }, status: 201
  end

  private

  def usersJSON(userArray)
    jsonObjects = Array.new
    userArray.each do |aUser|
      jsonObjects << aUser.jsonNotation
    end
    return jsonObjects
  end

  private

  def contact_params(aContact)
    aContact.permit(:first_name, :middle_name, :last_name, :prefix, :suffix, :nickname, :job_title, :department, :organization, :birthdate, :note, :creation_date, :modification_date)
  end

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name)
  end

  def phone_params aPhone
    aPhone.permit(:label, :number)
  end

  def email_params anEmail
    anEmail.permit(:label, :email)
  end
end
