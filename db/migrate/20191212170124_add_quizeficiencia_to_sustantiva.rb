class AddQuizeficienciaToSustantiva < ActiveRecord::Migration[6.0]
  def change
    add_column :sustantivas, :quizeficiencia, :text
  end
end
