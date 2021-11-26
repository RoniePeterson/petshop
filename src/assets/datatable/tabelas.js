$().ready(function(){
    $('#table01').DataTable({
        "lengthMenu": [[10, 30, 50, 100, -1], [10, 30, 50, 100, "Todos"]],
        language: {
            decimal: ",",
            processing:     "Processando...",
            search:         "Pesquisar:",
            lengthMenu:    "_MENU_ itens/páginas",
            info:           "Mostrando de _START_ de _TOTAL_ registros",
            infoEmpty:      "Mostrando 0 até 0 de 0 registros",
            infoFiltered:   "(Filtrados de _MAX_ registros)",
            infoPostFix:    "",
            loadingRecords: "Carregando...",
            zeroRecords:    "Nenhum registro encontrado",
            emptyTable:     "Nenhum registro encontrado",
            paginate: {
                first:      "Primeiro",
                previous:   "Anterior",
                next:       "Próximo",
                last:       "Último"
            },
            aria: {
                sortAscending:  ": Ordenar colunas de forma ascendente",
                sortDescending: ": Ordenar colunas de forma descendente"
            }
        },
    });
    $(".alert").click(function(){$(this).fadeOut();});
});
