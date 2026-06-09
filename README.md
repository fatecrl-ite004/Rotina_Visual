# Rotina Visual 

*   Equipe: Gabrielle Almeida Lima, Maria Leticia Zaborski Laurentino
*   Público-alvo: Pais e cuidadores de crianças com transtorno do espectro autista.
*   Tipo de aplicação: Sistema mobile.
*   Plataforma(s): Android.
*   Domínio: Saúde.
*   Previsão de entrega: Junho.

## Visão geral 

Aplicação mobile para auxiliar pais e cuidadores de crianças com TEA para a criação de rotinas diárias com o auxílio de pictogramas, timers e mudanças inesperadas.

Os usuários impactados pelo problema são pais, cuidadores e mediadores escolares de crianças com TEA. A solução proposta funciona direcionando o foco para os cuidadores da pessoa com TEA, tendo o responsável com usuário principal, para criação de rotinas de modo fácil que irão auxiliar em uma maior previsão das atividades do dependente.

## Problema

O usuário se encontra confuso e sobrecarregado ao ter que organizar rotinas para seus dependentes de forma analógica com papel e caneta. Reescrever as mesmas rotinas assim como organizar calendários é cansativo, e a simplicidade de um aplicativo que sempre mostra as rotinas sem a necessidade de uma manutenção constante é uma solução simples e prática. Dessa forma, há uma melhora na qualidade de vida do cuidador e do dependente, que agora possuem mais tempo para outras atividades.

**Funcionalidades**

*   Criação, edição e exclusão de atividades;
*   Galeria de pictogramas para comunicação não-verbal;
*   _Timer visual para uma melhor noção de tempo e duração de atividades e tarefas;_
*   _Lembrete de que certa tarefa está acabando;_
*   _Apresentação de imprevistos de forma sensível;_
*   _Opção de adicionar pictogramas ilimitados para a comunicação com autistas não-verbais._

## Diferencial / Concorrência

**PICTALK BUDDY**

Pictalk Buddy é um aplicativo de agenda e rotinas para pessoas com deficiência cognitiva ou transtorno do neurodesenvolvimento. A aplicação se utiliza de recursos de text-to-speech e passo-a-passo com vídeos para ações do dia-a-dia. Pode ser utilizada por indivíduos, cuidadores, profissionais e empresas. Faz um ótimo proveito de pictogramas, contando com um motor de busca que facilita o uso, assim como a opção de adicionar imagens da galeria pessoal do usuário. Apesar de prático, é de origem francesa e não conta com uma tradução verdadeiramente fiel ao público brasileiro. Além disso, sua geração de rotina automática não é adaptada ao fuso horário do Brasil, o que obriga o usuário a editar todos os seus componentes de forma manual.

**ROTINA DIVERTIDA**

Após uma análise por parte dos componentes do grupo, pôde-se constatar a facilidade do uso do aplicativo Rotina Divertida. Foi idealizado para o uso de pais e filhos por desenvolvedores brasileiros, caracterizado por seu sistema de recompensas por meio de “estrelas” ganhas ao concluir tarefas. Contando com uma interface simples e manuais de uso, a aplicação se destaca em sua simplicidade e rapidez. Possui PECS (Sistema de Comunicação por Troca de Figuras) e a opção de criar figuras para a comunicação diária. Infelizmente, não é possível adicionar novas ações, o que as limita para apenas a “eu estou” e “eu quero”. 

**TIIMO**

Mediante análise da equipe, o planejador diário Tiimo se destaca em sua interface visualmente bonita, mas complicada para o usuário médio. Foi feito com pessoas neurodivergentes em mente para uso pessoal, com listas de tarefas e modo de foco para tarefas, mas há muitas opções e poucos guias de uso. Além disso, grande parte de suas opções não estão traduzidas, obrigando o utilizador a traduzir funções do inglês. Deve-se destacar, no entanto, que o software ainda se encontra em acesso antecipado, e por isso mudanças e correções são esperadas no futuro.

**DIFERENCIAIS**

Entre os diferenciais dos sistemas existentes e a aplicação apresentada, devem-se destacar os seguintes:

*   Facilidade de uso por pessoas totalmente leigas em tecnologia;
*   Timer visual para uma melhor noção de tempo e duração de atividades e tarefas;
*   Lembrete de que certa tarefa está acabando;
*   Apresentação de imprevistos de forma sensível;
*   Aplicativo feito com base em entrevistas a mediadores de escolas da Baixada Santista;
*   Opção de adicionar pictogramas ilimitados para a comunicação com autistas não-verbais.

## Inovação / Criatividade

O projeto se destaca por direcionar seu foco ao uso por parte do responsável ou do cuidador, em vez de se restringir exclusivamente à criança. A interface e a experiência do usuário serão projetadas considerando as características do transtorno, implementando cores suaves, um design limpo e de fácil compreensão, alarmes suaves para timers e uma vasta seleção de pictogramas. O projeto será feito em flutter, com a linguagem de programação Dart.

## Escopo do projeto

**Essencial**

*   Timers para tarefas;
*   Criação, edição e exclusão de tarefas;
*   Opção de diferenciar rotinas entre dias da semana;
*   Adição de imagens da galeria para criação de pictogramas;
*   Leitura dos pictogramas;
*   Banco de dados completo.

**Importante**
*   Sincronização de contas pessoais;
*   Funcionalidade de imprimir a rotina criada no aplicativo.
    

**Opcional**

*   Tema claro e escuro;
*   Paleta de cores personalizado

## Planejamento simplificado

| Etapa |        Descrição        | Prazo |
|:-----:|:-----------------------:|:-----:|
|   1   |   Definição do projeto  | 08/04 |
|   2   | Desenvolvimento inicial | 15/04 |
|   3   |        Integração       | 15/05 |
|   4   |          Testes         | 01/06 |
|   5   |      Entrega final      | 24/06 |
    
# Tecnologias

## **Estrutura da aplicação**

O sistema será organizado em uma estrutura composta por front-end, back-end, banco de dados e APIs de acessibilidade. O front-end será desenvolvido utilizando o Flutter, responsável pela interface gráfica e interação com o usuário, enquanto o back-end ficará encarregado do gerenciamento das informações e regras de funcionamento da aplicação. Para o armazenamento dos dados, será utilizado o SQL, permitindo a persistência de informações como rotinas, tarefas e preferências dos usuários. O sistema também utilizará APIs de text-to-speech e notificações push para recursos de acessibilidade, como leitura em voz alta dos pictogramas e demais textos e alertas. A comunicação entre as partes do sistema ocorrerá diretamente pela aplicação Flutter, realizando integração com o banco de dados e com as APIs utilizadas no projeto. 

## **Tecnologias utilizadas**

|    Categoria   |                 Tecnologia                |                                               Função no projeto                                               |
|:--------------:|:-----------------------------------------:|:-------------------------------------------------------------------------------------------------------------:|
|    Front-end   |                  Flutter                  |                                       Criar toda a interface do projeto                                       |
|    Back-end    |                    SQL                    |                                  Gerenciar e manipular os dados da aplicação                                  |
| Banco de dados |                    SQL                    |                                       Persistir informações dos usuários                                      |
| API/Integração | API de Text-to-Speech e notificações push |                   Leitura em voz alta de textos diversos e pictogramas, alertas e lembretes                   |
|   Ferramentas  |      GitHub, Trello, Figma, Lucidhart     | Versionamento, organização das tarefas, criação dos designs de alta e baixa fidelidade e criação de diagramas |

## **Justificativa técnica**

Para o front-end, a equipe escolheu o framework flutter pela capacidade de desenvolver aplicações multiplataforma utilizando um único código fonte, pelo hot reload (que permite ver mudanças em tempo real), pela boa performance, grande quantidade de bibliotecas e componentes prontos e facilidade na integração de recursos de acessibilidade.

Para o back-end, SQL, por ser uma tecnologia que ambas as integrantes têm experiência e por ser considerado um banco de dados confiável, que oferece maior controle sobre os dados dos usuários.

Para o back-end, SQLite, por ser um banco de dados leve, adequado para aplicações mobile, que permite o armazenamento das informações localmente, mesmo sem internet.

Para o versionamento, Github, por ser a melhor ferramenta de versionamento disponível que ambas integrantes têm experiência prévia.

Para as APIs, uma de text-to-speech (TTS) e push, para notificações, alertas e notificações por toque. Ambas são necessárias para a acessibilidade geral do projeto.

## **Integração entre sistemas**

O front-end será desenvolvido utilizando o Flutter, responsável pela interface da aplicação, criação das telas e recursos visuais de acessibilidade. 

O back-end será responsável pelo gerenciamento das informações da aplicação, regras de funcionamento da rotina, armazenamento e manipulação dos dados dos usuários e atividades. Para isso, será utilizada a linguagem SQL juntamente com o SGBD SQLite, permitindo persistência local dos dados mesmo sem conexão com a internet.

O banco de dados armazenará informações como usuários, rotinas, tarefas, horários, lembretes e preferências de acessibilidade, garantindo organização e controle dos dados da aplicação.

A aplicação também utilizará APIs voltadas para acessibilidade e comunicação com recursos do dispositivo. Entre elas, uma API de text-to-speech , responsável pela leitura em voz alta das atividades, pictogramas e notificações, e APIs de notificações push e alertas táteis, utilizadas para aviso do término de uma tarefa. 

A comunicação entre as partes do sistema ocorrerá dentro do Flutter, que realizará a integração com SQL e com as APIs de acessibilidade.

## **Organização do desenvolvimento**

A equipe pretende organizar o projeto utilizando o GitHub para versionamento e armazenamento do código-fonte, permitindo o controle de versões, acompanhamento das alterações realizadas e colaboração entre as integrantes. As tarefas serão divididas de acordo com as necessidades de cada etapa, utilizando branches separadas para organização das funcionalidades.

Para o acompanhamento e organização das atividades do projeto, a equipe tem utilizado o Trello para organização de datas, divisão de tarefas e acompanhamento das entregas.

## **Desafios técnicos esperados**

O maior desafio técnico esperado é a curva de aprendizagem na utilização do framework Flutter e da linguagem Dart, já que ambas as integrantes não têm experiência prévia e apenas recentemente começaram a aprender a tecnologia. 

# **Referências**

[https://pub.dev/packages/flutter\_tts](https://pub.dev/packages/flutter_tts)

[https://pub.dev/packages/push](https://pub.dev/packages/push)

https://flutter.dev/development/mobile
