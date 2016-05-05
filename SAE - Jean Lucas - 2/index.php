<!DOCTYPE html>
<?php
/*
NUNCA ESQUECER
-COM O INCLUDE ESTOU ABRINDO UMA CONEXAO COM O BD,
DEVO SEMPRE FECHA-LA DEPOIS DE USAR;
*/
  include("php/conect.php");
  require("php/conect.php");
?>
<html lang="pt">
  <head>
    <meta charset="utf-8">
    <meta name="author" content="Jean Lucas">
    <link rel="stylesheet" href="css/normalize.css" type="text/css">
    <link rel="stylesheet" href="css/estilo.css" type="text/css">
    <title>SAE - Sistema de Ações Estratégicas</title>
  </head>
  <body>
    <header>
          <div class="linha navbar">
            <div class="coluna col4">
              <h1>SAE</h1>
            </div>
            <div class="coluna col8">
              <ul class="menu">
                <li><a href="index.php">Áreas</a></li>
                <li><a href="membros.php">Membros</a></li>
                <li><a href="estrategi.php">Objetivos Estratégicos</a></li>
              </ul>
            </div>
          </div>
    </header>

    <div class="content">
      <section>
        <div class="linha">
          <div class="col6">
              <h4>Áreas cadastradas:</h4>

              <?php
                $result= $con->query('SELECT * FROM SAE.area');
                $con->close();
                while ($row = $result->fetch_array()) {
              ?>
              <form action="acao.php" method="post">
              <input type="submit" name='b1' value="<?php echo $row['nome'];?>">
              <br><br>
              </form>
              <?php
                }
              ?>

          </div>
        </div>
      </section>
    </div>


      <div id="footer">
          <div class="linha">
            <h4>Rodapé</h4>
          </div>
      </div>


  </body>
</html>
