<h1 align="center">Solução do Teste</h1>

O aplicativo foi feito no framework Android. Foi construído em Kotlin no padrão MVVM. Foram codificados testes unitários e instrumentais.

<h3>Observação</h3>O aplicativo foi construído como se tivesse uma chamada real para uma API. Porém, como o Json de resposta já foi dado, foi criado um arquivo de Mock no qual simula essa resposta de sucesso da API.

De qualquer forma, caso haja mudança da resposta mockada para a resposta da API, o app estará pronto para tratar erros e mostrar ao usuário. Esse fluxo também foi codificado em teste.

<h3>Tecnologias utilizadas e motivos</h3>

- <b>Padrão MVVM</b>
	Facilita a separação da camada de UI da camada de lógica, deixando o projeto mais escalável e testável.

- <b>Kotlin</b>
	Linguagem recomendada pela Google para fazer as aplicações. Além de ter uma sintaxe mais curta (diminuindo o tamanho do código) e ajudar a evitar erros de NullPointerException, traz outros diversos benefícios.

- <b>Android Navigation Component</b>
	Ajuda na visualização, nas chamadas, no gerenciamento e na organização das mudanças de telas dentro da aplicação.

- <b>Koin</b>
	Utilizado para injeção de dependência. Deixa o App mais modularizado e facilita os testes.

- <b>Coroutines</b>
	Utilizado para facilitar as chamadas assíncronas que acontecem durante a execução da aplicação.

- <b>Retrofit</b>
	Biblioteca que já possui suporte ao Coroutines e é responsável por realizar as requisições nas APIs.

- <b>Moshi</b>
	Utilizado para auxiliar a serialização e desserialização de objetos das requisições.

- <b>JUnit4</b>
	Utilizado para os testes instrumentais e unitários.

- <b>Espresso</b>
	Utilizado para os testes instrumentais.