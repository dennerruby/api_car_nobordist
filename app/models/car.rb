class Car < ApplicationRecord
    validates :marca, presence :true
    validates :veiculo, presence :true
    validates :ano, presence :true
    validates :descricao, presence :true
end
