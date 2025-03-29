# LEPORIDAE 0.1 - ALV (ALPINE LINUX VIRTUALIZATION) - TEST VERSION (unstable)

Leporidae 0.1 is certainly not an operating system; however, its endoskeleton and structure function as a resident system, an endosystem, that communicates directly with the kernel and the software’s lowest layers. Its primary distinction lies in its entire operational module being written in Ruby.

  The project is still in testing, but it is designed to run within a virtual machine integrated with Alpine Linux, with future versions potentially supporting microkernels or even a native monolithic kernel.

  Leporidae aims to be a compact and functional endosystem capable of running on external HDDs, SSDs, and similar devices, managing files and functionalities within these devices regardless of the host machine’s operating system. It encapsulates all processes within a secure and efficient virtualization environment, making it ideal for office environments or servers.

## REQUIREMENTS
- Ruby 3.3.6, Gem 3.6.6, Bundler 2.6.6
- Alpine Linux 3.21.3 - VIRTUAL

---

# SYSTEM DIRECTORY DIAGRAM

```
/lpr
├── @run
└── @usr
    ├── bin
    ├── krn
    │   └── lprk-0.1-ALV
    │       ├── Gemfile
    │       ├── Gemfile.lock
    │       ├── boot.rb
    │       ├── cmd.rb
    │       ├── main.rb
    │       └── recall.rb
    └── yml
        └── config.yaml
```

O diretório raiz ``/lpr`` contém duas pastas principais:

``@run:`` Diretório destinado ao armazenamento de arquivos de aplicações baixadas no ambiente Leporidae, incluindo arquivos de configuração e dados de runtime necessários para a execução das aplicações.

``@usr:`` Organiza subdiretórios essenciais para o funcionamento do sistema, incluindo binários executáveis (bin), componentes do kernel (krn), e arquivos de configuração (yml).

No diretório ``@usr/krn/lprk-0.1-ALV``, estão presentes os seguintes arquivos:

 - **main.rb:** Arquivo principal responsável por orquestrar a execução das funções centrais do sistema, coordenando a inicialização e chamadas subsequentes.

 - **recall.rb:** Módulo de interação direta com o kernel, responsável por realizar chamadas de sistema (syscalls) e operações de baixo nível.

 - **cmd.rb:** Define e gerencia as chamadas de sistema que serão encaminhadas para o recall.rb, funcionando como uma camada de abstração para syscalls.

 - **boot.rb:** Script de inicialização do sistema, responsável por configurar o ambiente, carregar dependências e invocar os componentes essenciais na ordem correta.

 - **Gemfile e Gemfile.lock:** Arquivos de gerenciamento de dependências Ruby, especificando e bloqueando versões de bibliotecas necessárias ao sistema.

No diretório ``@usr/yml``, o arquivo **config.yaml** armazena a configuração das syscalls e parâmetros do sistema, sendo referenciado dinamicamente pelos arquivos recall.rb e cmd.rb durante a execução.

---
