module ResponseCheckers
  def user_response_checker(user)
    expect(user).to be_a(Hash)

    expect(user[:data]).to be_a(Hash)

    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq('user')

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)

    expect(user[:data][:attributes]).to have_key(:id)
    expect(user[:data][:attributes][:id]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:image)
    expect(user[:data][:attributes][:image]).to be_a(String)

    expect(user[:data]).to have_key(:relationships)
    expect(user[:data][:relationships]).to be_a(Hash)

    expect(user[:data][:relationships]).to have_key(:friends)
    expect(user[:data][:relationships][:friends]).to be_a(Hash)

    expect(user[:data][:relationships][:friends]).to have_key(:data)
    expect(user[:data][:relationships][:friends][:data]).to be_an(Array)
  end

  def game_night_response_checker(game_night)
    expect(game_night).to be_a(Hash)

    expect(game_night).to have_key(:data)
    expect(game_night[:data]).to be_a(Hash)

    expect(game_night[:data]).to have_key(:type)
    expect(game_night[:data][:type]).to be_a(String)
    expect(game_night[:data][:type]).to eq('game_night')

    expect(game_night[:data]).to have_key(:attributes)
    expect(game_night[:data][:attributes]).to be_a(Hash)

    expect(game_night[:data][:attributes]).to have_key(:id)
    expect(game_night[:data][:attributes][:id]).to be_a(String)

    expect(game_night[:data][:attributes]).to have_key(:name)
    expect(game_night[:data][:attributes][:name]).to be_a(String)

    expect(game_night[:data][:attributes]).to have_key(:date)
    expect(game_night[:data][:attributes][:date]).to be_a(String)

    expect(game_night[:data][:attributes]).to have_key(:user_id)
    expect(game_night[:data][:attributes][:user_id]).to be_a(String)

    expect(game_night[:data][:attributes]).to have_key(:number_of_games)
    expect(game_night[:data][:attributes][:number_of_games]).to be_a(String)

    expect(game_night[:data]).to have_key(:relationships)
    expect(game_night[:data][:relationships]).to be_a(Hash)

    expect(game_night[:data][:relationships]).to have_key(:friends)
    expect(game_night[:data][:relationships][:friends]).to be_a(Hash)

    expect(game_night[:data][:relationships][:friends]).to have_key(:data)
    expect(game_night[:data][:relationships][:friends][:data]).to be_an(Array)
  end
end
