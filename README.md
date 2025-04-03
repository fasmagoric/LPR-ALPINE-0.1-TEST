# LEPORIDAE 0.1 - ALV (ALPINE LINUX VIRTUALIZATION) - TEST VERSION (unstable)
[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE) ![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) <br>


Leporidae 0.1 is certainly not an operating system; however, its endoskeleton and structure function as a resident system, an endosystem, that communicates directly with the kernel and the software’s lowest layers. Its primary distinction lies in its entire operational module being written in Ruby.

  The project is still in testing, but it is designed to run within a virtual machine integrated with Alpine Linux, with future versions potentially supporting microkernels or even a native monolithic kernel.

  Leporidae aims to be a compact and functional endosystem capable of running on external HDDs, SSDs, and similar devices, managing files and functionalities within these devices regardless of the host machine’s operating system. It encapsulates all processes within a secure and efficient virtualization environment, making it ideal for office environments or servers.

<br>

## REQUIREMENTS
- Ruby 3.3.6
- Gem 3.6.6
- Bundler 2.6.6
- Alpine Linux 3.21.3 - VIRTUAL
- Advanced Linux Sound Architecture Driver (ALSA) k6-12.20-0-virt (and alsa-utils)

<br>

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

The root directory ``/lpr`` contains two main folders:

``@run:`` Directory intended for storing application files downloaded in the Leporidae environment, including configuration files and runtime data necessary for application execution.

``@usr:`` Organizes essential subdirectories for system operation, including executable binaries (bin), kernel components (krn), and configuration files (yml).

In the ``@usr/krn/lprk-0.1-ALV`` directory, the following files are present:

 - **main.rb:** Main file responsible for orchestrating the execution of the system's core functions, coordinating initialization and subsequent calls.

 - **recall.rb:** Direct interaction module with the kernel, responsible for performing system calls (syscalls) and low-level operations.

 - **cmd.rb:** Defines and manages the system calls that will be forwarded to recall.rb, functioning as an abstraction layer for syscalls.

 - **boot.rb:** System initialization script, responsible for setting up the environment, loading dependencies, and invoking essential components in the correct order.

 - **Gemfile and Gemfile.lock:** Ruby dependency management files, specifying and locking the versions of libraries required by the system.

In the ``@usr/yml`` directory, the **config.yaml** file stores the configuration of syscalls and system parameters, being dynamically referenced by the recall.rb and cmd.rb files during execution.
