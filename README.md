
# RentaCar | Rent A Car - alugue um carro.
A plataforma RentaCar será um sistema web destinado a oferecer aos seus usuários a locação de veículos, permitindo a realização de todo o processo burocrático online. Por meio da plataforma é possível um cliente realizar seu cadastro e, a partir de seu CPF, poderá efetuar uma locação. Seu principal objetivo é oferecer comodidade ao cliente, garantindo a segurança dos seus dados. O Rentacar possui um modelo de trabalho baseado no conceito de CRUD, ou seja, permite o cadastro, busca, edição e deleção de dados. Tais dados são manipulados pelos usuários logados. Para ter acesso ao sistema é necessário a autenticação através de login, permitido apenas para os usuários registrados anteriormente no sistema.

## Estrutura do Diretório
```bash
├── rentacar
│   ├── requisitos
│   ├── src
│        ├── backend
│        │   ├── Api
│        │   ├── packages
│        │   ├── rentacar
│        │   ├── Rentacar.Test
│        │   ├── Rentacar.TestSelenium
│        │   ├── Repository
│        │   ├── WebApp
│        │   ├── dump.sql
│        │   ├── rentacar.sln
│        │
│        ├──frontend
│            ├──public
│            ├──src
│                ├──components
│                ├──constants
│                ├──screens 
│                ├──App.css
│                ├──App.js
│                ├──index.css
│                ├──index.js
│            ├──LICENSE
│            ├──package.json
│            ├──README.md 
│            ├──yarn.lock
 

```

## Tecnologias Utilizadas
- [IDE Visual Studio](https://visualstudio.microsoft.com/)
- [Linguagem C# 7.3](https://docs.microsoft.com/pt-br/dotnet/csharp/)
- [Postgres SQL 2017 14.0](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)
- [Razor Pages](https://docs.microsoft.com/pt-br/aspnet/core/razor-pages/index?view=aspnetcore-3.0&tabs=visual-studio)
- [HTML 5](https://pt.wikipedia.org/wiki/HTML5)
- [Bootstrap](https://getbootstrap.com/)
- [Javascript](https://pt.wikipedia.org/wiki/JavaScript)
- [React](https://pt-br.reactjs.org/)
- [Redux Saga](https://redux-saga.js.org/)
- [Axios](https://github.com/axios/axios)
- [Antd](https://ant.design/docs/react/introduce)

## Regras para Codificação do Sistema
- Nomear variáveis e funções em padrão Camel Case;
- Nomear classes com iniciais maiúsculas e padrão Camel Case;
- Nomear variáveis, funções e classes de maneira intuitiva;
- Identar o código com 4 espaços;
- Código deverá ser desenvolvido na IDE Visual Studio.

## Padrões para uso de branches 
Para o desenvolvimento do sistema deverá ser utilizado o conceito de double branch, sendo: 
1. `master` onde fica o projeto atualizado e em "produção";
2. `developer` que será utilizada pelos desenvolvedores do sistema;

## Padrões para commits
- Usar os verbos no modo Particípio (exemplo: Atualizada a documentação do sistema)
- Primeira linha deve ter no máximo 50 caracteres
- O corpo do commit pode receber um detalhamento mais aprofundado 
