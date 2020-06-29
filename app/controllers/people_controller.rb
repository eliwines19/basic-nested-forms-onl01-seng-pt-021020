class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.address.build(address_type:"work")
    @person.address.build(address_type:"home")
  end

  def create
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name, address_attributes: [
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zip_code,
      :address_type
      ]
    )
  end
end
