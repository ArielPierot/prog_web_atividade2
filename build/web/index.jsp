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
              <h5 class="modal-title">Criar disciplina</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Código</label>
                          <input type="text" class="form-control" id="create_codigo_id">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Nome</label>
                          <input type="text" class="form-control" id="create_nome">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">N. Créditos</label>
                          <input type="text" class="form-control" id="create_n_creditos">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pre_requisito_id_1">Pré-requisito (1)</label>
                            <select class="form-control pre_requisito" data-style="btn btn-link" id="create_pre_requisito_id_1">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pre_requisito_id_2">Pré-requisito (2)</label>
                            <select class="form-control pre_requisito" data-style="btn btn-link" id="create_pre_requisito_id_2">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="create_model" onClick="return criarDisciplina()">Criar disciplina</button>
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
              <h5 class="modal-title">Editar disciplina</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Código</label>
                          <input type="text" class="form-control" id="edit_codigo_id">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">Nome</label>
                          <input type="text" class="form-control" id="edit_nome">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                          <label for="exampleFormControlInput1">N. Créditos</label>
                          <input type="text" class="form-control" id="edit_n_creditos">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pre_requisito_id_1">Pré-requisito (1)</label>
                            <select class="form-control pre_requisito" data-style="btn btn-link" id="edit_pre_requisito_id_1">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pre_requisito_id_2">Pré-requisito (2)</label>
                            <select class="form-control pre_requisito" data-style="btn btn-link" id="edit_pre_requisito_id_2">
                              <option value=null>- selecione -</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id="save_edit" onClick="return updateDisciplina()">Salvar alterações</button>
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
          <li class="nav-item active ">
            <a class="nav-link" href="/">
              <i class="material-icons">content_paste</i>
              <p>Disciplinas</p>
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
            <a class="navbar-brand" href="#pablo">Lista de disciplinas</a>
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
                    <h4 class="card-title ">Lista de disciplinas</h4>
                    <p class="card-category"> Lista de disciplinas para incluir, alterar ou excluir</p>
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
      $.fn.carregarPreRequisitos();
  });
  
    $(document).on('blur', "input[type=text]", function () {
       $(this).val(function (_, val) {
           return val.toUpperCase();
       });
   });
   
  $.fn.carregarDados = function(){
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
            var tabela = '<table class="table">\
                      <thead class=" text-primary">\
                        <th>\
                          Código\
                        </th>\
                        <th>\
                          Nome\
                        </th>\
                        <th>\
                          Créditos\
                        </th>\
                        <th>\
                          Pré-requisito (1)\
                        </th>\
                        <th>\
                          Pré-requisito (2)\
                        </th>\
                        <th>\
                          Ações\
                        </th>\
                      </thead>\
                      <tbody>';
                  
            
            $(response).each(function(index, valor) {
                
                    tabela += '<tr>\
                                        <td>' + valor.codigo + '</td>\
                                        <td>' + valor.nome + '</td>\
                                        <td>' + valor.n_creditos + '</td>\
                                        <td>' + valor.pre_requisito_1 + '</td>\
                                        <td>' + valor.pre_requisito_2 + '</td>\
                                        <td>\
                                        <button class="btn btn-primary btn-fab btn-fab-mini btn-round" onClick="return editarDisciplina(this)" data-toggle="modal" data-target="#editModal" alt="Editar" value='+ valor.id +'><i class="material-icons">edit</i></button>\
                                        <button class="btn btn-primary btn-fab btn-fab-mini btn-round" onClick="return deletarDisciplina(this)" alt="Deletar" value='+ valor.id +'><i class="material-icons">delete</i></button>\
                                        </td>\
                                    </tr>';
            });
            
            tabela += ' </tbody>\
                    </table>';
            
            $("#listagem").append(tabela);
        }
    });
  };
  
    function criarDisciplina(){
        
      $("#alerta").empty();
        
      var formData = {
        'codigo': $("#create_codigo_id").val(),
        'nome': $("#create_nome").val(),
        'n_creditos': $("#create_n_creditos").val(),
        'pre_req_1': $("#create_pre_requisito_id_1 option:selected").val(),
        'pre_req_2': $("#create_pre_requisito_id_2 option:selected").val()
      };
      
        $.ajax({
          url:"CriarDisciplina",
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
                                    Não foi possível criar essa disciplina.\
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                        <span aria-hidden="true">&times;</span>\
                                      </button>\
                                  </div>';

                    $("#alerta").append(alerta);
                }     
            }
      });
    };
    
    function updateDisciplina(){
        
      $("#alerta").empty();
        
      var formData = {
        'id': $("#edit_id").val(),
        'codigo': $("#edit_codigo_id").val(),
        'nome': $("#edit_nome").val(),
        'n_creditos': $("#edit_n_creditos").val(),
        'pre_req_1': $("#edit_pre_requisito_id_1 option:selected").val(),
        'pre_req_2': $("#edit_pre_requisito_id_2 option:selected").val()
      };
      
        $.ajax({
          url:"UpdateDisciplina",
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
                                    Não foi possível criar essa disciplina.\
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                        <span aria-hidden="true">&times;</span>\
                                      </button>\
                                  </div>';

                    $("#alerta").append(alerta);
                }     
            }
      });
    };
  
    function deletarDisciplina(current){
        
      var formData = {
        'id': current.value
      };
      
      $("#alerta").empty();
            
      $.ajax({
        url:"DeletarDisciplina",
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
                                Há vínculo dessa disciplina em outra tabela e não foi possível excluir.\
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
                                    <span aria-hidden="true">&times;</span>\
                                  </button>\
                              </div>';
            
                $("#alerta").append(alerta);
            }     
        }
    });
        
  };
  
  function editarDisciplina(current){
        
      $("#edit_id").empty();
      $("#edit_id").val(current.value);
      
      $('#edit_pre_requisito_id_1 option').attr("selected", false);
      $('#edit_pre_requisito_id_2 option').attr("selected", false);
      
      var formData = {
        'id': current.value
      };
      
      $.ajax({
        url:"BuscarDisciplina",
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
            $("#edit_codigo_id").val(response[0].codigo);
            $("#edit_nome").val(response[0].nome);
            $("#edit_n_creditos").val(response[0].n_creditos);
            $('#edit_pre_requisito_id_1 option[value="'+ response[0].pre_req_1 +'"]').attr("selected", "selected");
            $('#edit_pre_requisito_id_2 option[value="'+ response[0].pre_req_2 +'"]').attr("selected", "selected");
        }
            
        });
      
  }
  
  $.fn.carregarPreRequisitos = function(){
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
                $(".pre_requisito").append($('<option>', {
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