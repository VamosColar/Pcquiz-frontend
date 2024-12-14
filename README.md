# Aplicativo PC - Quiz Educativo

## Visão geral

Aplicativo desenvolvido em Flutter que busca perguntas e categorias de uma API REST. Em sua versáo inicial os usuários podem se identificar por e-mail ou anonimamente, selecionar uma categoria (missão do jogo) e responder perguntas para ganhar pontos. O aplicativo usa `GetX` para gerenciamento de estado e roteamento.

---

## Recursos

- Acesso do usuário baseado em e-mail ou anônimo.
- Buscar categorias e perguntas da API.
- Acompanhamento do progresso para perguntas e exibição de pontuação.

---

## Configuração do projeto

### 1. **Pré-requisitos**

- Flutter Versão 3+ instalado.
- Acesso à API junto com o token
- Add o arquivo `.env` à raiz do projeto com o seguinte:

```
BASE_URL=https://pcquiz.tfos.com.br/api
API_TOKEN=xxxxxxxxxx
```

### 2. **Instalar dependências**

Execute os seguintes comandos para buscar dependências:

```bash
flutter pub get
```

### 3. **Estrutura do arquivo**

```
lib/
|-- app/
| |-- category_page.dart
| |-- home_page.dart
| |-- login_page.dart
| |-- quiz_result_page.dart
| |-- quiz_page.dart
|-- controller/
| |-- auth_controller.dart
| |-- quiz_controller.dart
|-- models/
| |-- category_model.dart
| |-- option_model.dart
| |-- question_model.dart
|-- repository/
| |-- quiz_repository.dart
|-- services/
| |-- quiz_service.dart
|-- widgets/
| |-- custom_btn_speed_dial.dart
| |-- custom_progress_bar.dart
```

---

## Como executar o aplicativo

1. Certifique-se de que o arquivo `.env` esteja configurado corretamente.
2. Execute o aplicativo:

```bash
flutter run
```
