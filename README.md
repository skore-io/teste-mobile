# Skore teste mobile

Projeto feito para o teste mobile da skore


# Dependencias usadas
- sqflite:
- path:  
- http:  
- http_interceptor:  
- intl:  
- bloc_pattern:  
- bloc_provider:
### dev_dependencies
- mockito:

# Arquitetura do projeto (dir)
- dao: Contém a classe que controla a persistência de dados com sqflite, podendo salvar, deletar e listar todos;
- http: Diretório se encontra o web client e onde também contém subdiretórios sendo:
	- interceptors: Onde há a classe com os interceptadores http;
	- services: Contém a classe que controla as requisições http;
- model: Diretório contendo todos os modelos usados no projeto
- scenes: Diretório onde eu controlo as cenas (tela e bloc) onde há subdiretórios relacionados a uma cena, cada uma contendo sua tela e seu bloc;
- widgets: diretório onde deve ser criados os widgets:
	- dialogs: Diretório contendo as dialgos(modais) criadas no projeto;
	- lessons: Diretório contendo widgets específicos para a tela principal (lessons_screen.dart).

# Arquitetura de testes

- flow: Diretório que conterá todos os fluxos de testes (sequencia de testes para validar widgets e regras de negócio);
- mocks: Diretório usado para separar os mocks do resto da arquitetura
- unit: Diretório contendo testes unitários;
- widgets: Diretório contendo os testes realizados para validar widgets.

## Sobre o fluxo de testes

O fluxo de testes da tela principal (lessons_screen.dart) é um fluxo não muito complexo. O mesmo segue até concluir o delete de algum item da lista, usando mockito para as classes de web client e dao, usando também uma instância do LessonsBloc para que seja possível mocar dados para os testes. 

## Interface gráfica
Finalizei o projeto com uma interface simples e intuitiva não focando muito na parte gráfica do projeto e sim tentando manter um bom código.
> Já estudei UX e UI mas não achei necessário criar um template chamativo, levando em conta que demoraria mais para que eu finalizasse o projeto. 

## Padrão de projeto
No começo foi um pouco problemático para mim entender como o BloC funciona ainda mais co-relação a testes. Mas o mesmo me lembrou ViewModel e LiveData usados no android, os quais eu trabalho diariamente.
