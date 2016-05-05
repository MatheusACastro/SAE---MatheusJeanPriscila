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
          <div class="linha">
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
          <div class="linha center">
            <?php
              $acao = $_POST['b2'];
              $area= $con->query("SELECT * FROM SAE.acao_estrategica WHERE nome="."\"$acao\"");
              foreach ($area as $value) {
                $idarea= $value['area_id_area'];
                $area= $con->query("SELECT * FROM SAE.area WHERE id_area="."\"$idarea\"");
                foreach ($area as $ar) {
                  $a= $ar['nome'];
                  break;
                }
                break;
              }

            ?>

            <?php
              $area= $con->query("SELECT * FROM SAE.acao_estrategica WHERE nome="."\"$acao\"");
              foreach ($area as $value) {
            ?>

              <form class="">
                <div class="coluna col12">
                  <label class="negrito">Diretoria:</label>
                  <label class=""><?php echo $a; ?></label>
                </div>
              </div>

              <div class="linha center">
                <div class="coluna col12">
                  <label class="negrito">Ação:</label>
                  <label class=""><?php echo $_POST['b2'] ?></label>
                </div>
              </div>

              <div class="linha">
                <div class="coluna col12">
                  <label class="negrito">Objetivo:</label>
                  <label class=""><?php echo $value['descricao'];?></label>
                </div>
              </div>

              <div class="linha">
                <div class="coluna col6">
                  <label class="negrito">Custo Planejado:</label>
                  <label class=""><?php echo $value['custo_planejado'];?></label>
                </div>
                <div class="coluna col6">
                  <label class="negrito">Custo Realizado:</label>
                  <label class=""><?php echo $value['custo_realizado'];?></label>
                </div>

              </div>

              <div class="linha">
                <div class="coluna col12">
                  <label class="negrito">Membro responsável:</label>
                  <label for="">
                  <?php $idmembro= $value['membro_id_membro'];
                        $membro= $con->query("SELECT * FROM SAE.membro WHERE id_membro="."\"$idmembro\"");
                        foreach ($membro as $m) {
                          echo $m['nome'];
                          break;
                        }
                  ?>

                  </label>
                </div>
            </div>
            <div class="linha">
              <div class="coluna col12">
                <label class="negrito">Status:</label>
                <label for="">
                <?php
                if ($value['status']==1) {
                  echo "Não iniciada";
                }
                if ($value['status']==2) {
                  echo "Em andamento";
                }
                if ($value['status']==3) {
                  echo "Concluida";
                }
                if ($value['status']==4) {
                  echo "Concluida com atraso";
                }
                if ($value['status']==5) {
                  echo "Atrasada";
                }

                $idw= $value['5w2h_id_5w2h'];
                      $inf= $con->query("SELECT * FROM SAE.5w2h WHERE id_5w2h="."\"$idw\"");
                      foreach ($inf as $w) {
                        $w1= $w['oque'];
                        $w2= $w['como'];
                        $w3= $w['onde'];
                        $w4= $w['quando'];
                        $w5= $w['porque'];
                        $w6= $w['quem'];
                        $w7= $w['quanto'];

                        break;
                      }
                ?>
                <?php
                  }
                  $con->close();

                ?>

                </label>
              </div>
            </div>
              <div class="linha center negrito">
                <div class="coluna col2">
                  <label class="">O que?</label>
                </div>

                <div class="coluna col2">
                  <label class="">Como?</label>
                </div>

                <div class="coluna col1">
                  <label class="">Onde?</label>
                </div>

                <div class="coluna col2">
                  <label class="">Quando?</label>
                </div>

                <div class="coluna col2">
                  <label class="">Porque?</label>
                </div>

                <div class="coluna col2">
                  <label class="">Quem?</label>
                </div>

                <div class="coluna col1">
                  <label class="">Quanto?</label>
                </div>

              </div>

              <div class="linha center">
                <div class="coluna col2">
                    <label><?php echo $w1;?></label>
                </div>

                <div class="coluna col2">
                  <label><?php echo $w2;?></label>
                </div>

                <div class="coluna col1">
                  <label><?php echo $w3;?></label>
                </div>

                <div class="coluna col2">
                  <label><?php echo $w4;?></label>
                </div>

                <div class="coluna col2">
                  <label><?php echo $w5;?></label>
                </div>

                <div class="coluna col2">
                  <label><?php echo $w6;?></label>
                </div>

                <div class="coluna col1">
                  <label><?php echo $w7;?></label>
                </div>

              </div>
            </form>

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
