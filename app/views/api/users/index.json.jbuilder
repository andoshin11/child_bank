json.users do
  json.array!(@users) do |user|
    json.(
      user,
      :id, :name, :email
    )
    json.wallet do
      if user.wallet.present?
        json.(
          user.wallet,
          :id, :point
        )
      else
        json.(
          Wallet.new,
          :id, :point
        )
      end
    end
  end
end
