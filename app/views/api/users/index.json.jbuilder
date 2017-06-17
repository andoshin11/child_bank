json.users do
  json.array!(@users) do |user|
    json.(
      user,
      :id, :name, :email
    )
    json.wallet do
      json.(
        user.wallet,
        :id, :point
      )
    end
  end
end
