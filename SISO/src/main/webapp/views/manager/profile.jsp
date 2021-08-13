<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>

<head>
    <title>SISO</title>
    <link href="${context}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${context}/assets/css/util.css" rel="stylesheet">
</head>

<body class="bg-light">
    <c:if test="${access}">
        <nav class="navbar navbar-expand-lg navbar-dark bg-azul shadow">
            <div class="container-fluid">
                <span class="navbar-brand">Sistema de Seguimiento a Oficios</span>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <nav class="navbar-nav">
                        <a class="nav-link" href="${context}/Gestión_de_Oficios?redirect=records">Gestión de oficios</a>
                        <a class="nav-link" href="${context}/Gestión_de_Auxiliares?redirect=assistants">Gestión de auxiliares</a>
                        <a class="nav-link active" href="${context}/Perfil?redirect=profile">Perfil</a>
                    </nav>
                    <nav class="navbar-nav ms-auto">
                        <a class="nav-link active" href="${context}/Inicio_de_Sesión?redirect=login">
                            <svg class="feather">
                                <use xlink:href="${context}/assets/icons/feather-sprite.svg#log-out" />
                            </svg>
                            <span> Salir</span>
                        </a>
                    </nav>
                </div>
            </div>
        </nav>
        <c:if test="${message != null}">
            <c:if test="${messageType == 1}">
                <div class="alert alert-primary alert-dismissible fade show m-3" role="alert">
                    <svg class="feather-24">
                        <use xlink:href="${context}/assets/icons/feather-sprite.svg#info" />
                    </svg>
                    <span> ${message}</span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${messageType == 2}">
                <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
                    <svg class="feather-24">
                        <use xlink:href="${context}/assets/icons/feather-sprite.svg#check-circle" />
                    </svg>
                    <span> ${message}</span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${messageType == 3}">
                <div class="alert alert-warning alert-dismissible fade show m-3" role="alert">
                    <svg class="feather-24">
                        <use xlink:href="${context}/assets/icons/feather-sprite.svg#alert-circle" />
                    </svg>
                    <span> ${message}</span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${messageType == 4}">
                <div class="alert alert-danger alert-dismissible fade show m-3" role="alert">
                    <svg class="feather-24">
                        <use xlink:href="${context}/assets/icons/feather-sprite.svg#alert-triangle" />
                    </svg>
                    <span> ${message}</span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        </c:if>
        <div class="container mt-4">
            <div class="card shadow-sm">
                <h5 class="card-header">Perfil</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p class="fw-bold m-0">
                                Nombre de usuario:
                            </p>
                            <p>
                                ${user.nameUser}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p class="fw-bold m-0">
                                Nombre:
                            </p>
                            <p>
                                ${user.name.concat(" ").concat(user.lastname1).concat(" ").concat(user.lastname2)}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p class="fw-bold m-0">
                                Correo electrónico:
                            </p>
                            <p>
                                ${user.email}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p class="fw-bold m-0">
                                Rol:
                            </p>
                            <p>
                                ${user.type_id.nameType}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p class="fw-bold m-0">
                                Departamento:
                            </p>
                            <p>
                                ${user.department_id.nameDepartment}
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" height="1000px">
                            <button class="btn btn-verde">
                                <svg class="feather">
                                    <use xlink:href="${context}/assets/icons/feather-sprite.svg#edit" />
                                </svg>
                                <span> Modificar datos</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" tabindex="-1" id="attendedRecordModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle del oficio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Número de oficio:
                                    </span>
                                    <p id="modal2RecordId"></p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Fecha de canalización:
                                    </span>
                                    <p id="modal2ChannellingDate"></p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Fecha de asignación:
                                    </span>
                                    <p id="modal2AssignmentDate"></p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Fecha de respuesta:
                                    </span>
                                    <p id="modal2ResponseDate"></p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Departamento:
                                    </span>
                                    <p id="modal2Department"></p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Prioridad:
                                    </span>
                                    <p>
                                        <span id="modal2Priority"></span>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <span class="fw-bold">
                                        Comentario:
                                    </span>
                                    <p id="modal2Comment"></p>
                                </div>
                            </div>
                            <div class="row">
                                <h5>Acciones:</h5>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <form action="${context}/ServletRecords" method="POST" target="_blank" class="m-0">
                                        <input type="hidden" value="getRecordById" name="action">
                                        <input type="hidden" id="modal2RecordIdInput" name="recordIdInput">
                                        <button type="submit" class="btn btn-primary w-100">
                                            <svg class="feather">
                                                <use xlink:href="${context}/assets/icons/feather-sprite.svg#file-text" />
                                            </svg>
                                            <span> Visualizar archivo</span>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${! access}">
        <div class="alert alert-danger m-3">
            <svg class="feather-24">
                <use xlink:href="${context}/assets/icons/feather-sprite.svg#alert-triangle" />
            </svg>
            <span> Error: No tienes acceso a este sitio.</span>
        </div>
    </c:if>
    <script src="${context}/assets/js/bootstrap.bundle.js"></script>
</body>

</html>