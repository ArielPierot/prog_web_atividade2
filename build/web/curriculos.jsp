<%-- 
    Document   : index
    Created on : 30/08/2018, 21:37:28
    Author     : Ariel Pierot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Atividade Lista 2
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
    <!-- Modal de create -->
    <div class="modal fade" id="createModal" tabindex="-1" role="dialog" style="display: none;">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Criar currículo</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Período</label>
                          <input type="text" class="form-control" id="create_n_periodo">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="create_disciplina_id">Disciplina</label>
                            <select class="form-control disciplinas" data-style="btn btn-link" id="create_disciplina_id">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Disciplina Tipo</label>
                          <select class="form-control" data-style="btn btn-link" id="create_disciplina_tipo">
                              <option value="O">O</option>
                              <option value="C">C</option>
                           </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="create_model" onClick="return criarCurriculo()">Criar currículo</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
          </div>
        </div>
      </div>
    <!-- Modal de create -->
    
    <!-- Modal de edição -->
    <div class="modal fade" id ="editModal" tabindex="-1" role="dialog" style="display: none;">
        <input type="hidden" id="edit_id" name="edit_id">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Editar currículo</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Período</label>
                          <input type="text" class="form-control" id="edit_n_periodo">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="create_disciplina_id">Disciplina</label>
                            <select class="form-control disciplinas" data-style="btn btn-link" id="edit_disciplina_id">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Disciplina Tipo</label>
                          <select class="form-control" data-style="btn btn-link" id="edit_tipo_disciplina">
                              <option value="O">O</option>
                              <option value="C">C</option>
                           </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="save_edit" onClick="return updateCurriculo()">Salvar alterações</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
          </div>
        </div>
      </div>
    <!-- Modal de edição -->  
    
    
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
          <span class="simple-text logo-normal">PROGRAMAÇÃO WEB</span>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item ">
            <a class="nav-link" href="/AtividadeLista2/">
              <i class="material-icons">content_paste</i>
              <p>Disciplinas</p>
            </a>
          </li>
          <li class="nav-item active ">
            <a class="nav-link" href="/AtividadeLista2/curriculos.jsp">
              <i class="material-icons">content_paste</i>
              <p>Currículos</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">Lista de currículos</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="material-icons">dashboard</i>
                  <p class="d-lg-none d-md-block">
                    Stats
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">5</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Mike John responded to your email</a>
                  <a class="dropdown-item" href="#">You have 5 new tasks</a>
                  <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                  <a class="dropdown-item" href="#">Another Notification</a>
                  <a class="dropdown-item" href="#">Another One</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-success pull-right" data-toggle="modal" data-target="#createModal">
                        <i class="material-icons">save</i> Criar novo
                     </button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" id="alerta"></div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header card-header-primary">
                    <h4 class="card-title ">Lista de currículos</h4>
                    <p class="card-category"> Lista de currículos para incluir, alterar ou excluir</p>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <span id="listagem"></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="https://creative-tim.com/presentation">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
              <li>
                <a href="https://www.creative-tim.com/license">
                  Licenses
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chartist JS -->
  <script src="assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="assets/demo/demo.js"></script>
  <script type="text/javascript">
 
  $( document ).ready(function() {
      $("#listagem").empty();
      $.fn.carregarDados();
      $.fn.carregarDisciplinas();
  });
  
    $(document).on('blur', "input[type=text]", function () {
       $(this).val(function (_, val) {
           return val.toUpperCase();
       });
   });
   
  $.fn.carregarDados = function(){
      $.ajax({
        url:"ListarCurriculos",
        type: 'GET',
        dataType: "json",
        async: false,
        cache: false,
        timeout: 30000,
        error: function(){
            return true;
        },
        success: function(response){
            var tabela = '<table class="table">\
                      <thead class=" text-primary">\
                        <th>\
                          Curso\
                        </th>\
                        <th>\
                          Período\
                        </th>\
                        <th>\
                          Disciplina\
                        </th>\
                        <th>\
                          Disciplina Tipo\
                        </th>\
                        <th>\
                          Ações\
                        </th>\
                      </thead>\
                      <tbody>';
                  
            
            $(response).each(function(index, valor) {
                
                    tabela += '<tr>\
                                        <td>' + valor.curso + '</td>\
                                        <td>' + valor.n_periodo + '</td>\
                                        <td>' + valor.disciplina + '</td>\
                                        <td>' + valor.tipo_disciplina + '</td>\
                                        <td>\
                                        <button class="btn btn-primary btn-fab btn-fab-mini btn-round" onClick="return editarCurriculo(this)" data-toggle="modal" data-target="#editModal" alt="Editar" value='+ valor.id +'><i class="material-icons">edit</i></button>\
                                        <button class="btn btn-primary btn-fab btn-fab-mini btn-round" onClick="return deletarCurriculo(this)" alt="Deletar" value='+ valor.id +'><i class="material-icons">delete</i></button>\
                                        </td>\
                                    </tr>';
            });
            
            tabela += ' </tbody>\
                    </table>';
            
            $("#listagem").append(tabela);
        }
    });
  };
  
    function criarCurriculo(){
        
      $("#alerta").empty();
        
      var formData = {
        'n_periodo': $("#create_n_periodo").val(),
        'disciplina_id': $("#create_disciplina_id option:selected").val(),
        'disciplina_tipo': $("#create_disciplina_tipo option:selected").val()
      };
      
        $.ajax({
          url:"CriarCurriculo",
          type: 'POST',
          data: formData,
          dataType: "json",
          async: false,
          cache: false,
          timeout: 30000,
          complete: function(response){
              
                obj = eval('(' + response.responseText + ')');

                if(obj.criado !== 'false')
                {
                    location.reload();                    
                }
                else
                {
                    var alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">\
                                    Não foi possível criar esse currículo.\
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                        <span aria-hidden="true">&times;</span>\
                                      </button>\
                                  </div>';

                    $("#alerta").append(alerta);
                }     
            }
      });
    };
    
    function updateCurriculo(){
        
      $("#alerta").empty();
        
      var formData = {
        'id': $("#edit_id").val(),
        'n_periodo': $("#edit_n_periodo").val(),
        'disciplina_id': $("#edit_disciplina_id option:selected").val(),
        'tipo_disciplina': $("#edit_tipo_disciplina option:selected").val()
      };
      
        $.ajax({
          url:"UpdateCurriculo",
          type: 'POST',
          data: formData,
          dataType: "json",
          async: false,
          cache: false,
          timeout: 30000,
          complete: function(response){
              
                obj = eval('(' + response.responseText + ')');

                if(obj.alterado !== 'false')
                {
                    location.reload();
                    
                }
                else
                {
                    var alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">\
                                    Não foi possível alterar esse currículo.\
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                        <span aria-hidden="true">&times;</span>\
                                      </button>\
                                  </div>';

                    $("#alerta").append(alerta);
                }     
            }
      });
    };
  
    function deletarCurriculo(current){
        
      var formData = {
        'id': current.value
      };
      
      $("#alerta").empty();
            
      $.ajax({
        url:"DeletarCurriculo",
        type: 'POST',
        data: formData,
        dataType: "json",
        async: false,
        cache: false,
        timeout: 30000,
        complete: function(response){
            obj = eval('(' + response.responseText + ')');
            
            if(obj.deletado !== 'false')
            {
                location.reload();
            }
            else
            {
                var alerta = '<div class="alert alert-danger alert-dismissible fade show" role="alert">\
                                Há vínculo desse currículo em outra tabela.\
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                    <span aria-hidden="true">&times;</span>\
                                  </button>\
                              </div>';
            
                $("#alerta").append(alerta);
            }     
        }
    });
        
  };
  
  function editarCurriculo(current){
        
      $("#edit_id").empty();
      $("#edit_id").val(current.value);
      
      $('#edit_tipo_disciplina option').attr("selected", false);
      $('#edit_disciplina_id option').attr("selected", false);
      
      var formData = {
        'id': current.value
      };
      
      console.log(current.value);
      
      $.ajax({
        url:"BuscarCurriculo",
        type: 'GET',
        data: formData,
        dataType: "json",
        async: false,
        cache: false,
        timeout: 30000,
        error: function(){
            return true;
        },
        success: function(response){
            console.log(response);
            $("#edit_n_periodo").val(response[0].n_periodo);
            $('#edit_tipo_disciplina option[value="'+ response[0].tipo_disciplina +'"]').attr("selected", "selected");
            $('#edit_disciplina_id option[value="'+ response[0].disciplina_id +'"]').attr("selected", "selected");
        }
            
        });
      
  }
  
  $.fn.carregarDisciplinas = function(){
      $.ajax({
        url:"ListarDisciplinas",
        type: 'GET',
        dataType: "json",
        async: false,
        cache: false,
        timeout: 30000,
        error: function(){
            return true;
        },
        success: function(response){
            
            $(response).each(function(index, valor) {
                $(".disciplinas").append($('<option>', {
                    value: valor.id,
                    text: valor.nome.toUpperCase()
                }));
            });
        }
        
    });
  }
    
  </script>  
</body>

</html>