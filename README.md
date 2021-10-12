# laboratorio_bridge

__Sobre mim:__

  Autor: Dariel Arian Acosta Campos.

__Sobre as ferramentas utilizadas:__

  Ferramenta utilziada para front-end: Flutter v2.6.0-12.0.pre.300 <br />
  Linguagem utilizada: Dart v2.15.0 <br />
  Ide utilzada para criar com flutter: Android Studio v2020.3 <br />
  Para o back-end: Node.js v10.19.0 <br />
  Ide utilizada para criar com Node.js: Visual Studio Code v1.56.2 <br />

__Dependências:__

  Flutter: <br />
  - flutter_bloc: ^7.3.0 <br />
  - http: ^0.13.4 <br />

  Node.js: <br />
  - 'express': ^4.17.1 <br />
  - 'cors': ^2.8.5 <br />
  - 'body-parser': ^1.19.0
  
__Quer rodar localmente? Tente isto:__

  Front-End <br />
    1. Baixe o Flutter: https://flutter.dev/docs/get-started/install. <br />
    2. Baixe o Android Studio: https://developer.android.com/studio?hl=pt&gclid=Cj0KCQjw5JSLBhCxARIsAHgO2SfjxBv_GmC85bCVSCgh1RlsRpRlon3pYm6qSmjNqxcVBaJh7HDMh3QaAru8EALw_wcB&gclsrc=aw.ds <br />
    3. Baixe o Dart: https://dart.dev/get-dart <br />
    4. Baixe os pluguins do dart e do flutter no Android Studio. <br />
    5. Crie um novo projeto Flutter no android studio, a opção Web deve estar marcada.<br />
    6. Chame o projeto de "duodigito". Isto irá economizar de mudar alguns imports depois. <br />
    7. Neste repositorio há uma pasta chamada flutter-lib e dentro uma pasta chamada lib. <br />
    8. Baixe essa pasta e em seguida substitua a pasta lib do projeto criado por esta do repositório. <br />
    9. Agora busque no projeto criado um arquivo chamado "pubspec.yaml", abra-o. <br />
    10. Busque no arquivo até encontrar o seguinte: <br />
    - dependencies: <br />
    - - flutter: <br />
    - - - sdk: <br />
    11. Escreva embaixo o seguinte: <br />
    flutter_bloc: ^7.3.0 <br />
    http: ^0.13.4 <br />
    12. Deve ficar assim: <br />
    - dependencies: <br />
    - - flutter: <br />
    - - - sdk: <br />
    - - flutter_bloc: ^7.3.0 <br />
    - - http: ^0.13.4 <br />
    13. Importante respeitar os espaços. <br />
    14. Após isso rode no terminal o comando flutter pub get. <br />
    15. Agora pode rodar o projeto no chrome ou outro navegador. <br />

  Back-End <br />
    1. Baixe o Node.js e baixar a pasta neste repositório com o nome duodigito_api.<br />
    2. Procure o local onde foi baixada a pasta e digite no terminal: node index.js<br />
    3. Para ver o projeto rodando abra o seu navegador e procure na barra de navegação: localhost:3000.<br />

__Pode interessar:__
  
  O front-end funcional está disponível no site: https://duodigitoapp.web.app/#/
  O back-end funcional está disponivel no endereço: https://duodigitoapi.herokuapp.com/
  
__Importante:__
  
  Tanto localmente quanto no release, o back-end entrega as informações em Json quando se realiza um Post (isto pois em uma REST API). Acessando o endereço anterior (https://duodigitoapi.herokuapp.com/), veremos somente no navegador "its working", representando que o serviço está ativo.
