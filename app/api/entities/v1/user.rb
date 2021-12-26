module Entities
  module V1
    class User < Root
      # name, email, ageのみ表示する
      expose :name, :email, :age
    end
  end
end
