module ApplicationHelper
    def avatar_url account
        return account.image.gsub!("_normal", "") if account.image
        gravatar_id = Digest::MD5::hexdigest(account.email).downcase
        "https://avatars.dicebear.com/v2/jdenticon/b#{gravatar_id}5ea87e#{gravatar_id}6#{gravatar_id}31b49c#{gravatar_id}aa480b7fe5c#{gravatar_id}.svg"
    end
end
