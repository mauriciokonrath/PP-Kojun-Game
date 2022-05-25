-- principal

-- pontos para se perguntar para o professor:
--  * vai existir algum conflito se o nome do modulo ser o mesmo que o de um tipo dentro do mesmo?
--  * quando for realizar o import, e o modulo nao se encontra no mesmo diretorio,
--    precisa especificar o caminho (igual ao python)?


main = do
  let m = newMatrix 2 2
  print(m)
  print(set m (1,1) 2)
