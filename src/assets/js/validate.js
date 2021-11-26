$('#myform').validate({
    rules: {
        nome_completo: {
            required: true,
            minlength: 3
        },
        local_residencia: {
            required: true,
            minlength: 3
        },
        numero_cpf: {
            // required: true,
            minlength: 11,
            // number: true,
        },
        tipo_atendimento: {
            required: true
        },
        ligou_129: {
            required: true
        },
        processo_judicial: {
            required: true
        },
        situacao_urgente: {
            required: true
        },
        situacao_protecao: {
            required: true
        },
        tem_prazo_intimacao: {
            required: true
        },
        como_ajudar: {
            required: true,
            minlength: 5
        },
        telefones: {
            // required: true,
            minlength: 9
        },
        email_contato: {
            // required: true,
            email: true,
        },
        email_naj: {
            required: true,
            email: true,
        },
        nome_atendente: {
            required: true,
            minlength: 5
        },

    },
    messages: {
        nome_completo: {
            required: 'Por favor, preencha o campo: "Qual o seu nome completo?"',
            minlength: 'O campo deve possuir pelo menos 3 caracteres.'
        },
        local_residencia: {
            required: 'Por favor, preencha o campo: "Onde você reside?"',
            minlength: 'O campo deve possuir pelo menos 3 caracteres.'
        },
        numero_cpf: {
            // required: 'Por favor, Informe seu cpf.',
            minlength: 'O campo deve possuir pelo menos 11 caracteres.',
            maxlength: 'O campo deve possuir pelo no máximo 11 caracteres.',
            // number: "Informe o CPF somente com números."
        },
        tipo_atendimento: {
            required: 'Selecione uma das opções.',
        },
        ligou_129: {
            required: 'Selecione uma das opções.',
        },
        processo_judicial: {
            required: 'Selecione uma das opções.',
        },
        situacao_urgente: {
            required: 'Selecione uma das opções.',
        },
        situacao_protecao: {
            required: 'Selecione uma das opções.',
        },
        tem_prazo_intimacao: {
            required: 'Selecione uma das opções.',
        },
        como_ajudar: {
            required: 'Por favor, preencha o campo: "Como a Defensoria pode lhe ajudar?"',
            minlength: 'O campo deve possuir pelo menos 5 caracteres.'
        },
        telefones: {
            required: 'Por favor, preencha o campo: "Quais os seus telefones para contato? Você tem acesso ao whatsapp neles? "',
            minlength: 'O campo deve possuir pelo menos 9 caracteres. Formato telefone (xx)x.xxxx-xxxx'
        },
        email_contato: {
            required: 'Por favor, preencha o campo: "Qual o seu e-mail para contato?"',
            email: 'Informe um e-mail válido. Ex.: fulano@gmail.com'
        },
        email_naj: {
            required: 'Por favor, preencha o campo: "Qual o seu e-mail para contato?"',
            email: 'Informe um e-mail válido. Ex.: naj@defensoria.df.gov.br'
        },
        nome_atendente: {
            required: 'Por favor, preencha o campo: "Nome Atendente"',
            minlength: 'O campo deve possuir pelo menos 5 caracteres.'
        },

    }
});